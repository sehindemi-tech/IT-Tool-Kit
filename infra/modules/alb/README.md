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
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/lb_target_group) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_lifecycle_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_lifecycle_configuration) | resource |
| [aws_s3_bucket_policy.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/security_group) | resource |
| [aws_vpc_security_group_egress_rule.alb_egress_ecs_task](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.alb_ingress_internet](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_elb_service_account.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/elb_service_account) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb"></a> [alb](#input\_alb) | ALB configuration | <pre>object({<br/>    name                       = string<br/>    enable_deletion_protection = optional(bool, false)<br/>    public_subnets             = list(string)<br/>    ip_address_type            = optional(string, "ipv4")<br/><br/>    access_logs = object({<br/>      enabled = optional(bool, true)<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_alb_access_logs_bucket"></a> [alb\_access\_logs\_bucket](#input\_alb\_access\_logs\_bucket) | ALB access log S3 bucket | <pre>object({<br/>    bucket_name = string<br/>    rule = object({<br/>      id     = string<br/>      status = optional(string, "Enabled")<br/><br/>      expiration = object({<br/>        days = optional(number, 7)<br/>      })<br/>    })<br/><br/>  })</pre> | n/a | yes |
| <a name="input_alb_listener"></a> [alb\_listener](#input\_alb\_listener) | COnfiguration for HTTP and HTTPS listner | <pre>map(object({<br/>    port            = number<br/>    protocol        = string<br/>    ssl_policy      = optional(string)<br/>    certificate_arn = optional(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_alb_sg"></a> [alb\_sg](#input\_alb\_sg) | Security Group for ALB | <pre>object({<br/>    name        = string<br/>    description = string<br/>    vpc_id      = string<br/>    ingress_rule = map(object({<br/>      from_port   = number<br/>      to_port     = number<br/>      ip_protocol = string<br/>      cidr_ipv4   = string<br/>    }))<br/>    egress_rule = map(object({<br/>      from_port   = number<br/>      to_port     = number<br/>      ip_protocol = string<br/>      cidr_ipv4   = string<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_alb_target_group"></a> [alb\_target\_group](#input\_alb\_target\_group) | The alb target group configuration | <pre>object({<br/>    name                              = string<br/>    port                              = number<br/>    protocol                          = string<br/>    target_type                       = string<br/>    vpc_id                            = string<br/>    load_balancing_cross_zone_enabled = bool<br/>    ip_address_type                   = string<br/><br/>    health_check = object({<br/>      enabled             = string<br/>      path                = string<br/>      port                = string<br/>      protocol            = string<br/>      matcher             = string<br/>      interval            = number<br/>      timeout             = number<br/>      healthy_threshold   = number<br/>      unhealthy_threshold = number<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | The projects Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_security_group_id"></a> [alb\_security\_group\_id](#output\_alb\_security\_group\_id) | ALB security group ID |
<!-- END_TF_DOCS -->