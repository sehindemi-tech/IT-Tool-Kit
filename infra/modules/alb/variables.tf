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

variable "alb_target_group" {
  description = "The alb target group configuration"
  type = object({
    name                              = string
    port                              = number
    protocol                          = string
    target_type                       = string
    vpc_id                            = string
    load_balancing_cross_zone_enabled = bool
    ip_address_type                   = string

    health_check = object({
      enabled             = string
      path                = string
      port                = string
      protocol            = string
      matcher             = string
      interval            = number
      timeout             = number
      healthy_threshold   = number
      unhealthy_threshold = number
    })
  })
}

variable "alb_listener" {
  description = "COnfiguration for HTTP and HTTPS listner"
  type = map(object({
    port            = number
    protocol        = string
    ssl_policy      = optional(string)
    certificate_arn = optional(string)
  }))
}