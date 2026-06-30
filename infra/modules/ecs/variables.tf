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