resource "aws_cloudwatch_log_group" "this" {
  name                        = var.ecs_cloudwatch.name
  skip_destroy                = var.ecs_cloudwatch.skip_destroy
  deletion_protection_enabled = var.ecs_cloudwatch.deletion_protection_enabled
  log_group_class             = var.ecs_cloudwatch.log_group_class
  retention_in_days           = var.ecs_cloudwatch.retention_in_days
}

