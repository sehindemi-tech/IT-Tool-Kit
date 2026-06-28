# networking

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
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/internet_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_rt_association](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_rt_association](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table_association) | resource |
| [aws_security_group.endpoints_sg](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/security_group) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc) | resource |
| [aws_vpc_security_group_ingress_rule.endpoints_sg_ingress](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_ingress_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The proects Name | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Public and Private Subnets for the VPC | <pre>map(object({<br/>    cidr_block              = string<br/>    availability_zone       = string<br/>    map_public_ip_on_launch = optional(string, false)<br/>    is_public               = optional(bool)<br/>  }))</pre> | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC settings | <pre>object({<br/>    cidr_block           = string<br/>    enable_dns_hostnames = optional(bool, true)<br/>    enable_dns_support   = optional(bool, true)<br/>    vpc_name             = string<br/>  })</pre> | n/a | yes |
| <a name="input_vpc_endpoints_sg"></a> [vpc\_endpoints\_sg](#input\_vpc\_endpoints\_sg) | Vpc endpoing security group | <pre>object({<br/>    name        = optional(string)<br/>    description = optional(string)<br/>    from_port   = number<br/>    to_port     = number<br/>    ip_protocol = string<br/>  })</pre> | n/a | yes |
<!-- END_TF_DOCS -->
