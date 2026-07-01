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

variable "ecs_task_definition" {
  description = "The ECS task definition configuration"
  type = object({
    family                   = string
    cpu                      = number
    memory                   = number
    network_mode             = string
    requires_compatibilities = list(string)
    runtime_platform = object({
      operating_system_family = string
      cpu_architecture        = string
    })
    container_definition = object({
      name                     = string
      image                    = string
      essential                = optional(bool, true)
      privileged               = optional(bool, false)
      user                     = string
      readonly_root_filesystem = optional(bool, true)

      port_mappings = object({
        container_port = number
        protocol       = optional(string, "tcp")
      })

      health_check = object({
        command      = list(string)
        interval     = optional(number, 30)
        retries      = optional(number, 3)
        start_period = optional(number, 60)
        timeout      = optional(number, 5)
      })
      log_configuration = object({
        log_driver = string
        options = object({
          awslogs_stream_prefix = string
        })
      })
    })
  })
}
