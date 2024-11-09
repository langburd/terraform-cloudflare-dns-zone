output "cloudflare_existing_zones" {
  description = "Cloudflare existing DNS zones."
  value       = module.cloudflare_dns.existing_zones
}

output "cloudflare_created_zones" {
  description = "Cloudflare created DNS zones."
  value       = module.cloudflare_dns.created_zones
}
