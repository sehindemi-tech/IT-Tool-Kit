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
