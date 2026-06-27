variable "project_settings" {
  description = "The default settings for our IT tools project"

  type = object({
    aws_region  = optional(string, "eu-west-2")
    org         = optional(string, "sehindemi-tech")
    project     = optional(string, "it-tool-kit")
    envrionment = optional(string, "dev")
    iac_managed = optional(string, "Terraform")
  })

  default = {}
}
