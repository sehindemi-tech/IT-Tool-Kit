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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecs_cloudwatch"></a> [ecs\_cloudwatch](#input\_ecs\_cloudwatch) | ECS cloudwatch configuration | <pre>object({<br/>    name                        = string<br/>    skip_destroy                = bool<br/>    deletion_protection_enabled = bool<br/>    log_group_class             = string<br/>    retention_in_days           = number<br/>  })</pre> | n/a | yes |
<!-- END_TF_DOCS -->