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
| [aws_appautoscaling_policy.cpu](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_policy.memory](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/appautoscaling_policy) | resource |
| [aws_appautoscaling_target.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/appautoscaling_target) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/cloudwatch_log_group) | resource |
| [aws_cloudwatch_metric_alarm.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/cloudwatch_metric_alarm) | resource |
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/ecs_cluster) | resource |
| [aws_ecs_service.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/ecs_service) | resource |
| [aws_ecs_task_definition.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/ecs_task_definition) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.task_execution](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/iam_role_policy_attachment) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/security_group) | resource |
| [aws_sns_topic.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/sns_topic) | resource |
| [aws_sns_topic_policy.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/sns_topic_policy) | resource |
| [aws_sns_topic_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/sns_topic_subscription) | resource |
| [aws_vpc_security_group_egress_rule.ecs_to_aws_services](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_egress_rule.ecs_to_s3](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_egress_rule) | resource |
| [aws_vpc_security_group_ingress_rule.alb_to_ecs](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/vpc_security_group_ingress_rule) | resource |
| [aws_ec2_managed_prefix_list.s3](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/ec2_managed_prefix_list) | data source |
| [aws_iam_policy_document.ecs_assume_role](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.sns](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_autoscaling_policy"></a> [app\_autoscaling\_policy](#input\_app\_autoscaling\_policy) | Configuration for the auto scaling policy | <pre>object({<br/>    policy_type        = string<br/>    cpu_target         = number<br/>    scale_in_cooldown  = number<br/>    scale_out_cooldown = number<br/>    memory_target      = number<br/>  })</pre> | n/a | yes |
| <a name="input_cloudwatch_alarms"></a> [cloudwatch\_alarms](#input\_cloudwatch\_alarms) | The Cloudwatch alarm metrics settings. | <pre>map(object({<br/>    alarm_name          = string<br/>    comparison_operator = string<br/>    evaluation_periods  = number<br/>    metric_name         = string<br/>    namespace           = string<br/>    period              = number<br/>    threshold           = number<br/>    alarm_description   = string<br/>    datapoints_to_alarm = number<br/>    dimensions          = map(string)<br/>    treat_missing_data  = string<br/>  }))</pre> | n/a | yes |
| <a name="input_ecs_app_auto_scalling_target"></a> [ecs\_app\_auto\_scalling\_target](#input\_ecs\_app\_auto\_scalling\_target) | The ECS auto scaling configuration | <pre>object({<br/>    max_capacity = number<br/>    min_capacity = number<br/>  })</pre> | n/a | yes |
| <a name="input_ecs_cloudwatch"></a> [ecs\_cloudwatch](#input\_ecs\_cloudwatch) | ECS cloudwatch configuration | <pre>object({<br/>    name                        = string<br/>    skip_destroy                = bool<br/>    deletion_protection_enabled = bool<br/>    log_group_class             = string<br/>    retention_in_days           = number<br/>  })</pre> | n/a | yes |
| <a name="input_ecs_cluster"></a> [ecs\_cluster](#input\_ecs\_cluster) | ECS cluster setttings | <pre>object({<br/>    name = string<br/>    setting = object({<br/>      name  = string<br/>      value = string<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_ecs_iam_roles"></a> [ecs\_iam\_roles](#input\_ecs\_iam\_roles) | The task execution iam role | <pre>map(object({<br/>    name        = string<br/>    description = string<br/>    policy_arns = list(string)<br/>  }))</pre> | n/a | yes |
| <a name="input_ecs_security_group"></a> [ecs\_security\_group](#input\_ecs\_security\_group) | Configuration for the ECS security group | <pre>object({<br/>    name        = string<br/>    description = string<br/>    vpc_id      = string<br/>    ingress_rule = object({<br/>      from_port   = number<br/>      to_port     = number<br/>      ip_protocol = string<br/>      cidr_ipv4   = string<br/>    })<br/>    egress_rule = object({<br/>      from_port   = number<br/>      to_port     = number<br/>      ip_protocol = string<br/>      cidr_ipv4   = string<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_ecs_service"></a> [ecs\_service](#input\_ecs\_service) | The ecs service configuration | <pre>object({<br/>    name                               = string<br/>    availability_zone_rebalancing      = string<br/>    deployment_maximum_percent         = number<br/>    deployment_minimum_healthy_percent = number<br/>    desired_count                      = number<br/>    enable_ecs_managed_tags            = bool<br/>    health_check_grace_period_seconds  = number<br/>    launch_type                        = string<br/>    propagate_tags                     = string<br/>    deployment_circuit_breaker = object({<br/>      enable   = bool<br/>      rollback = bool<br/>    })<br/>    load_balancer = object({<br/>      container_name   = string<br/>      container_port   = number<br/>      target_group_arn = string<br/>    })<br/>    network_configuration = object({<br/>      assign_public_ip = bool<br/>      subnets          = list(string)<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_ecs_task_definition"></a> [ecs\_task\_definition](#input\_ecs\_task\_definition) | The ECS task definition configuration | <pre>object({<br/>    family                   = string<br/>    cpu                      = number<br/>    memory                   = number<br/>    network_mode             = string<br/>    requires_compatibilities = list(string)<br/><br/>    runtime_platform = object({<br/>      operating_system_family = string<br/>      cpu_architecture        = string<br/>    })<br/><br/>    container_definition = object({<br/>      name                     = string<br/>      image                    = string<br/>      essential                = optional(bool, true)<br/>      privileged               = optional(bool, false)<br/>      user                     = string<br/>      readonly_root_filesystem = optional(bool, true)<br/><br/>      port_mappings = object({<br/>        container_port = number<br/>        protocol       = optional(string, "tcp")<br/>      })<br/><br/>      health_check = object({<br/>        command      = list(string)<br/>        interval     = optional(number, 30)<br/>        retries      = optional(number, 3)<br/>        start_period = optional(number, 60)<br/>        timeout      = optional(number, 5)<br/>      })<br/><br/>      log_configuration = object({<br/>        log_driver = string<br/><br/>        options = object({<br/>          awslogs_stream_prefix = string<br/>        })<br/>      })<br/>    })<br/>  })</pre> | n/a | yes |
| <a name="input_sns_topic_name"></a> [sns\_topic\_name](#input\_sns\_topic\_name) | The name os the sns topic | `string` | n/a | yes |
| <a name="input_sns_topic_subscription_email"></a> [sns\_topic\_subscription\_email](#input\_sns\_topic\_subscription\_email) | sns topic subscription email for ALARM state notification | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the IT tools cluster |
| <a name="output_ecs_security_group"></a> [ecs\_security\_group](#output\_ecs\_security\_group) | ECS security group ID |
| <a name="output_service_name"></a> [service\_name](#output\_service\_name) | The name of the IT tools service |
<!-- END_TF_DOCS -->