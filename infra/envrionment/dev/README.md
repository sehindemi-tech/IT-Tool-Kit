# dev

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.15.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 6.52.0 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project_settings"></a> [project\_settings](#input\_project\_settings) | The default settings for our IT tools project | <pre>object({<br/>    aws_region  = optional(string, "eu-west-2")<br/>    org         = optional(string, "sehindemi-tech")<br/>    project     = optional(string, "it-tool-kit")<br/>    envrionment = optional(string, "dev")<br/>    iac_managed = optional(string, "Terraform")<br/>  })</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
