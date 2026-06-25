variable "project_settings" {
  description = "The default settings for our IT tools project"
  type = object({
    aws_region  = optional(string, "eu-west-2")
    org         = optional(string, "sehindemi-tech")
    github_repo = optional(string, "IT-Tool-Kit")
    project     = optional(string, "it-tool-kit")
  })

  default = {}
}


variable "ecr_repo" {
  description = "ECR repo for the IT-Tools docker image"
  type = object({
    name                 = optional(string, "it-tools")
    encryption_type      = optional(string, "AES256")
    force_destroy        = optional(bool, false)
    image_tag_mutability = optional(string, "IMMUTABLE")
    scan_on_push         = optional(bool, true)
  })

  default = {}
}
