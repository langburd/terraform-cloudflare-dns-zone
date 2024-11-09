module "cloudflare_dns" {
  source     = "../../"
  zones_file = "./zones.yaml"
}
