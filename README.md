<a href="https://www.opsd.io" target="_blank"><img alt="OPSd" src=".github/img/OPSD_logo.svg" width="180px"></a>

Meet **OPSd**. The unique and effortless way of managing cloud infrastructure.

# terraform-module-aws-route53

## Introduction

The module is responsible for managing AWS Route53 (DNS).

## Usage

```hcl
module "manage_route53" {
  source  = "github.com/opsd-io/terraform-module-aws-route53?ref=v0.1.0"

  # Variables
  zone_name = "opsd.example.test"

  a_records = {
    website = {
      name    = "opsd.example.test"
      ttl     = "300"
      records = ["1.2.3.4"]
    }
  }

  cname_records = {
    website = {
      name    = "www"
      ttl     = "300"
      records = ["opsd.example.test"]
    }
  }
}
```

**IMPORTANT**: Make sure not to pin to master branch because there may be breaking changes between releases.

## Examples

See all the usage [examples](examples).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.17.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.17.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.a](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.cname](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.mx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ns](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.srv](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Domain A records. | <pre>map(object({<br>    name    = string<br>    ttl     = optional(number, 300)<br>    records = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Domain CNAME records. | <pre>map(object({<br>    name   = string<br>    ttl    = optional(number, 600)<br>    record = string<br>  }))</pre> | `{}` | no |
| <a name="input_mx_records"></a> [mx\_records](#input\_mx\_records) | Domain MX records. | <pre>map(object({<br>    name    = string<br>    ttl     = optional(number, 3600)<br>    records = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | Domain NS records. | <pre>map(object({<br>    name    = string<br>    ttl     = optional(number, 172800)<br>    records = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_srv_records"></a> [srv\_records](#input\_srv\_records) | Domain SRV records. | <pre>map(object({<br>    name    = string<br>    ttl     = optional(number, 3600)<br>    records = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC in which private domain will be created. | `string` | `null` | no |
| <a name="input_vpc_region"></a> [vpc\_region](#input\_vpc\_region) | AWS Region in which private domain will be created. | `string` | `null` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | The main domain name. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | Output for A records |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | Output for CNAME records |
| <a name="output_mx_records"></a> [mx\_records](#output\_mx\_records) | Output for MX records |
| <a name="output_name_servers"></a> [name\_servers](#output\_name\_servers) | The name servers of the domain zone. |
| <a name="output_ns_records"></a> [ns\_records](#output\_ns\_records) | Output for NS records |
| <a name="output_srv_records"></a> [srv\_records](#output\_srv\_records) | Output for SRV records |
| <a name="output_zone_arn"></a> [zone\_arn](#output\_zone\_arn) | The ARN of the domain zone. |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | The ARN of the domain zone. |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | The Name of the domain zone. |
<!-- END_TF_DOCS -->

## Contributing

If you are interested in contributing to the project, see see our [guide](https://github.com/opsd-io/contribution).

## Support

If you have a problem with the module or want to propose a new feature, you can report it via the project's (Github) issue tracker.

If you want to discuss something in person, you can join our community on [Slack](https://join.slack.com/t/opsd-community/signup).

## License

[Apache License 2.0](LICENSE)
