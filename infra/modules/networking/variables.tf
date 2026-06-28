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

variable "project_name" {
  description = "The proects Name"
  type        = string
}

variable "vpc_endpoints_sg" {
  description = "Vpc endpoing security group"
  type = object({
    name        = optional(string)
    description = optional(string)
    from_port   = number
    to_port     = number
    ip_protocol = string
  })
}