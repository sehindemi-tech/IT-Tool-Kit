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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/security_group) | resource |
| [aws_vpc_security_group_ingress_rule.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_sg"></a> [alb\_sg](#input\_alb\_sg) | Security Group for ALB | <pre>object({<br/>    name        = string<br/>    description = string<br/>    vpc_id      = string<br/>    ingress_rule = map(object({<br/>      from_port   = number<br/>      to_port     = number<br/>      ip_protocol = string<br/>      cidr_block  = string<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The proects Name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->