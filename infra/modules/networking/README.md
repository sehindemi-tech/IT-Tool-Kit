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
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/flow_log) | resource |
| [aws_iam_role.flow_logs_iam](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.flow_logs_iam_policies_attachment](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_internet_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/internet_gateway) | resource |
| [aws_route_table.private](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table) | resource |
| [aws_route_table_association.private_rt_association](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public_rt_association](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/route_table_association) | resource |
| [aws_security_group.endpoints_sg](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/security_group) | resource |
| [aws_subnet.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/subnet) | resource |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.interface_endpoint](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_security_group_ingress_rule.endpoints_sg_ingress](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_iam_policy_document.flow_logs_iam_policies](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_watch"></a> [cloud\_watch](#input\_cloud\_watch) | CLoud watch configuration for vpc flow logs | <pre>object({<br/>    name              = optional(string)<br/>    log_group_class   = optional(string, "STANDARD")<br/>    retention_in_days = optional(number, 7)<br/>  })</pre> | n/a | yes |
| <a name="input_interface_endpoint"></a> [interface\_endpoint](#input\_interface\_endpoint) | Interface endpoint configuration | <pre>map(object({<br/>    service_name    = string<br/>    ip_address_type = optional(string, "ipv4")<br/>  }))</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The proects Name | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Public and Private Subnets for the VPC | <pre>map(object({<br/>    cidr_block              = string<br/>    availability_zone       = string<br/>    map_public_ip_on_launch = optional(string, false)<br/>    is_public               = optional(bool)<br/>  }))</pre> | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC settings | <pre>object({<br/>    cidr_block           = string<br/>    enable_dns_hostnames = optional(bool, true)<br/>    enable_dns_support   = optional(bool, true)<br/>    vpc_name             = string<br/>  })</pre> | n/a | yes |
| <a name="input_vpc_endpoints_sg"></a> [vpc\_endpoints\_sg](#input\_vpc\_endpoints\_sg) | Vpc endpoing security group | <pre>object({<br/>    name        = optional(string)<br/>    description = optional(string)<br/>    from_port   = number<br/>    to_port     = number<br/>    ip_protocol = string<br/>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_endpoint_security_group_id"></a> [endpoint\_security\_group\_id](#output\_endpoint\_security\_group\_id) | The endpoints security group id |
| <a name="output_private_route_table_id"></a> [private\_route\_table\_id](#output\_private\_route\_table\_id) | Private route table id |
| <a name="output_private_subnets_id"></a> [private\_subnets\_id](#output\_private\_subnets\_id) | Private subnets IDs |
| <a name="output_public_subnets_id"></a> [public\_subnets\_id](#output\_public\_subnets\_id) | Public subnets IDs |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | vpc ipv4 cidr |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The VPC id |
<!-- END_TF_DOCS -->
