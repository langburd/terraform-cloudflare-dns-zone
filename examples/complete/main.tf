module "cloudflare_dns" {
  source  = "langburd/dns-zone/cloudflare"
  version = "~> 1.0"

  zones_file = "./zones.yaml"
}
