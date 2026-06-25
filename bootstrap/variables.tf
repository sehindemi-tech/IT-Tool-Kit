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
