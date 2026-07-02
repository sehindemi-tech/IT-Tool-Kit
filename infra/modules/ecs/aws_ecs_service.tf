resource "aws_ecs_service" "this" {
  name                               = var.ecs_service.name
  availability_zone_rebalancing      = var.ecs_service.availability_zone_rebalancing
  deployment_maximum_percent         = var.ecs_service.deployment_maximum_percent
  deployment_minimum_healthy_percent = var.ecs_service.deployment_minimum_healthy_percent
  cluster                            = aws_ecs_cluster.this.arn
  desired_count                      = var.ecs_service.desired_count
  enable_ecs_managed_tags            = var.ecs_service.enable_ecs_managed_tags
  health_check_grace_period_seconds  = var.ecs_service.health_check_grace_period_seconds
  launch_type                        = var.ecs_service.launch_type
  propagate_tags                     = var.ecs_service.propagate_tags
  task_definition                    = aws_ecs_task_definition.this.arn


  deployment_circuit_breaker {
    enable   = var.ecs_service.deployment_circuit_breaker.enable
    rollback = var.ecs_service.deployment_circuit_breaker.rollback
  }

  load_balancer {
    container_name   = var.ecs_service.load_balancer.container_name
    container_port   = var.ecs_service.load_balancer.container_port
    target_group_arn = var.ecs_service.load_balancer.target_group_arn
  }

  network_configuration {
    assign_public_ip = var.ecs_service.network_configuration.assign_public_ip
    security_groups  = [aws_security_group.this.id]
    subnets          = var.ecs_service.network_configuration.subnets
  }
}

variable "ecs_service" {
  description = "The ecs service configuration "
  type = object({
    name                               = string
    availability_zone_rebalancing      = string
    deployment_maximum_percent         = number
    deployment_minimum_healthy_percent = number
    desired_count                      = number
    enable_ecs_managed_tags            = bool
    health_check_grace_period_seconds  = number
    launch_type                        = string
    propagate_tags                     = string
    deployment_circuit_breaker = object({
      enable   = bool
      rollback = bool
    })
    load_balancer = object({
      container_name   = string
      container_port   = number
      target_group_arn = string
    })
    network_configuration = object({
      assign_public_ip = bool
      subnets          = list(string)
    })
  })
}