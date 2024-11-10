# Terraform Cloudflare DNS Zone Module

This Terraform module manages Cloudflare DNS zones and records.
It provides functionality to both create new DNS zones and manage records within existing zones using one YAML file.
The module is published in both [Terraform](https://registry.terraform.io/modules/langburd/dns-zone/cloudflare) and [OpenTofu](https://search.opentofu.org/module/langburd/dns-zone/cloudflare) registries.

## Features

- Create new Cloudflare DNS zones
- Manage existing Cloudflare DNS zones
- Create and manage DNS records of various types
- Supports multiple DNS records across different zones

## Usage

```terraform
module "cloudflare_dns" {
  source  = "langburd/dns-zone/cloudflare"
  version = "~> 1.0"

  # Path to your YAML configuration file
  zones_file = "./zones.yaml"
}
```

Example of `zones.yaml` (filename could be arbitrary):

```yaml
zones:
  - name: example.com
    create: true
    default_ttl: 3600
    records:
      - name: www
        type: A
        content: 192.0.2.1
        ttl: 600
        proxied: true
      - name: mail
        type: MX
        content: mail.example.com
        priority: 10
  - name: existing-domain.com
    create: false
    records:
      - name: api
        type: CNAME
        content: api.example.com
        ttl: 1800
        proxied: true
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 4.0, <= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 4.0, <= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.dns_records](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_zone.created_zones](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/zone) | resource |
| [cloudflare_accounts.current](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/accounts) | data source |
| [cloudflare_zone.existing_zones](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_zones_file"></a> [zones\_file](#input\_zones\_file) | Path to the YAML file containing DNS zones and records. | `string` | `"zones.yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_created_zones"></a> [created\_zones](#output\_created\_zones) | Cloudflare DNS zones. |
| <a name="output_dns_records"></a> [dns\_records](#output\_dns\_records) | Cloudflare DNS records. |
| <a name="output_existing_zones"></a> [existing\_zones](#output\_existing\_zones) | Cloudflare DNS zones. |
<!-- END_TF_DOCS -->

## Notes

- The module automatically handles TXT record content formatting by adding required quotes
- Zone IDs are automatically looked up and managed internally
- Record names are automatically formatted to ensure uniqueness

## Contributing

Contributions are welcome! This project uses pre-commit hooks to ensure code quality. Please make sure to install and run pre-commit before submitting any changes.

## License

<a href="https://opensource.org/license/mit"><img src="https://img.shields.io/badge/License-MIT-blue.svg?style=for-the-badge" alt="MIT License"></a>

<details>
<summary>MIT License</summary>
<br/>
<br/>

Complete license is available in the [`LICENSE`](LICENSE) file.

```text
Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

</details>

## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## Copyrights

Copyright © 2024 [Avi Langburd](https://github.com/langburd)
