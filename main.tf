locals {
  # Load the DNS zones from the zones file
  zones = yamldecode(file(var.zones_file))["dns_zones"]

  # Flatten the records into a combined list
  records = flatten([
    for zone in local.zones : [
      for record_type, records_of_type in zone.records : [
        for rec in records_of_type : {
          content     = rec.content
          create_zone = lookup(zone, "create", false)
          name        = rec.name
          priority    = lookup(rec, "priority", null)
          record_type = record_type
          ttl         = lookup(rec, "ttl", lookup(zone, "default_ttl", null))
          zone        = zone.name
        }
      ]
    ]
  ])

  # Combine the zone IDs from both created and existing zones
  zone_ids = merge(
    { for zone_name, zone in cloudflare_zone.created_zones : zone_name => zone.id },
    { for zone_name, zone in data.cloudflare_zone.existing_zones : zone_name => zone.id }
  )
}

# Get the Cloudflare account ID
data "cloudflare_accounts" "current" {}

# Data source to fetch existing DNS zones where create is false
data "cloudflare_zone" "existing_zones" {
  for_each = {
    for zone in local.zones : zone.name => zone if !lookup(zone, "create", false)
  }

  name = each.value.name
}

# Resource to create new DNS zones where create is true
resource "cloudflare_zone" "created_zones" {
  for_each = {
    for zone in local.zones : zone.name => zone if lookup(zone, "create", false)
  }

  account_id = data.cloudflare_accounts.current.accounts[0].id
  zone       = each.value.name
}

# Resource to create DNS records
resource "cloudflare_record" "dns_records" {
  for_each = {
    for record in local.records : "${substr(lower(record.zone), 0, 20)}_${substr(lower(record.record_type), 0, 5)}_${substr(lower(record.name), 0, 20)}_${substr(md5(record.content), 0, 19)}" => record
  }

  content  = each.value.record_type == "TXT" ? "\"${each.value.content}\"" : each.value.content
  name     = each.value.name
  priority = each.value.priority
  ttl      = each.value.ttl
  type     = each.value.record_type
  zone_id  = local.zone_ids[each.value.zone]
}
