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
| [aws_ecr_repository.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/ecr_repository) | resource |
| [aws_iam_openid_connect_provider.ths](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/iam_openid_connect_provider) | resource |
| [aws_iam_role.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/iam_role) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.name](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/resources/s3_bucket_versioning) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/6.52.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ecr_repo"></a> [ecr\_repo](#input\_ecr\_repo) | ECR repo for the IT-Tools docker image | <pre>object({<br/>    name                 = optional(string, "it-tools")<br/>    encryption_type      = optional(string, "AES256")<br/>    force_destroy        = optional(bool, false)<br/>    image_tag_mutability = optional(string, "IMMUTABLE")<br/>    scan_on_push         = optional(bool, true)<br/>  })</pre> | `{}` | no |
| <a name="input_project_settings"></a> [project\_settings](#input\_project\_settings) | The default settings for our IT tools project | <pre>object({<br/>    aws_region  = optional(string, "eu-west-2")<br/>    org         = optional(string, "sehindemi-tech")<br/>    github_repo = optional(string, "IT-Tool-Kit")<br/>    project     = optional(string, "it-tool-kit")<br/>  })</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
