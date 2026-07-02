# dns

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.15.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.52.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 6.52.0 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns"></a> [dns](#input\_dns) | The dns hosted zone configuration | <pre>object({<br/>    zone_name = string<br/>  })</pre> | n/a | yes |
| <a name="input_dns_alias"></a> [dns\_alias](#input\_dns\_alias) | The dns alias record | <pre>object({<br/>    type = string<br/>    alias = object({<br/>      alb_dns_name = string<br/>      alb_zone_id  = string<br/>    })<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | Zone ID of the hosted zone |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | Zone name of the hosted zone |
| <a name="output_zone_name_servers"></a> [zone\_name\_servers](#output\_zone\_name\_servers) | Zone hosted name servers |
<!-- END_TF_DOCS -->
