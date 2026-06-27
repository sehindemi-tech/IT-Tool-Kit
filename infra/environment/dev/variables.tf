variable "project_settings" {
  description = "The default settings for our IT tools project"

  type = object({
    aws_region  = optional(string, "eu-west-2")
    org         = optional(string, "sehindemi-tech")
    Project     = optional(string, "it-tool-kit")
    Environment = optional(string, "dev")
    Iac_managed = optional(string, "Terraform")

  })

  default = {}
}
