variable "ecs_cloudwatch" {
  description = "ECS cloudwatch configuration"
  type = object({
    name                        = string
    skip_destroy                = bool
    deletion_protection_enabled = bool
    log_group_class             = string
    retention_in_days           = number
  })
}


variable "ecs_iam_roles" {
  description = "The task execution iam role"
  type = map(object({
    name        = string
    description = string
    policy_arns = list(string)
  }))
}


variable "ecs_security_group" {
  description = "Configuration for the ECS security group"
  type = object({
    name        = string
    description = string
    vpc_id      = string
    ingress_rule = object({
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    })
    egress_rule = object({
      from_port   = number
      to_port     = number
      ip_protocol = string
      cidr_ipv4   = string
    })
  })
}

variable "ecs_cluster" {
  description = "ECS cluster setttings"
  type = object({
    name = string
    setting = object({
      name  = string
      value = string
    })
  })
}