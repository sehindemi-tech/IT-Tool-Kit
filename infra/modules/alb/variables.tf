variable "project_name" {
  description = "The projects Name"
  type        = string
}

variable "alb_sg" {
  description = "Security Group for ALB"
  type = object({
    name        = string
    description = string
    vpc_id      = string
    ingress_rule = map(object({
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_block  = string
    }))
  })
}

variable "alb_access_logs_bucket" {
  description = "ALB access log S3 bucket"
  type = object({
    bucket_name = string
    rule = object({
      id     = string
      status = optional(string, "Enabled")

      expiration = object({
        days = optional(number, 7)
      })
    })

  })
}

variable "alb" {
  description = "ALB configuration"

  type = object({
    name                       = string
    enable_deletion_protection = optional(bool, false)
    security_groups            = list(string)
    public_subnets             = list(string)
    ip_address_type            = optional(string, "ipv4")

    access_logs = object({
      enabled = optional(bool, true)
    })
  })
}