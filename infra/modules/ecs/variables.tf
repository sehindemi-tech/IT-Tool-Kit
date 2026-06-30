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

