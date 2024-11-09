output "existing_zones" {
  description = "Cloudflare DNS zones."
  value       = data.cloudflare_zone.existing_zones
}

output "created_zones" {
  description = "Cloudflare DNS zones."
  value       = cloudflare_zone.created_zones
}

output "dns_records" {
  description = "Cloudflare DNS records."
  value       = cloudflare_record.dns_records
}
