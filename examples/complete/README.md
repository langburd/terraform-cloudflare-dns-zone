# Terraform Cloudflare DNS Zones

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 4.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudflare_dns"></a> [cloudflare\_dns](#module\_cloudflare\_dns) | langburd/dns-zone/cloudflare | ~> 1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudflare_api_key"></a> [cloudflare\_api\_key](#input\_cloudflare\_api\_key) | The API key associated with your Cloudflare account. | `string` | n/a | yes |
| <a name="input_cloudflare_email"></a> [cloudflare\_email](#input\_cloudflare\_email) | The email address associated with your Cloudflare account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cloudflare_created_zones"></a> [cloudflare\_created\_zones](#output\_cloudflare\_created\_zones) | Cloudflare created DNS zones. |
| <a name="output_cloudflare_existing_zones"></a> [cloudflare\_existing\_zones](#output\_cloudflare\_existing\_zones) | Cloudflare existing DNS zones. |
<!-- END_TF_DOCS -->
