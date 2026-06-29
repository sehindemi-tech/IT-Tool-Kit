variable "project_name" {
  description = "The proects Name"
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