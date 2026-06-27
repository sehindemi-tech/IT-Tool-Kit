variable "vpc" {
  description = "The VPC settings"
  type = object({
    cidr_block           = string
    enable_dns_hostnames = optional(bool, true)
    enable_dns_support   = optional(bool, true)
    vpc_name             = string
  })
}