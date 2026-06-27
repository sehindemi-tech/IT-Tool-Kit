variable "vpc" {
  description = "The VPC settings"
  type = object({
    cidr_block           = string
    enable_dns_hostnames = optional(bool, true)
    enable_dns_support   = optional(bool, true)
    vpc_name             = string
  })
}

variable "subnets" {
  description = "Public and Private Subnets for the VPC"
  type = map(object({
    cidr_block              = string
    availability_zone       = string
    map_public_ip_on_launch = optional(string, false)
    is_public               = optional(bool)
  }))
}