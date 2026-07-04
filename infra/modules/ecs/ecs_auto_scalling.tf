resource "aws_appautoscaling_target" "this" {
  max_capacity       = var.ecs_app_auto_scalling_target.max_capacity
  min_capacity       = var.ecs_app_auto_scalling_target.min_capacity
  resource_id        = "service/${aws_ecs_cluster.this.name}/${aws_ecs_service.this.name}"
  scalable_dimension = "ecs:service:DesiredCount"
  service_namespace  = "ecs"
}

resource "aws_appautoscaling_policy" "cpu" {
  name               = "${aws_ecs_service.this.name}-cpu-scaling"
  policy_type        = var.app_autoscaling_policy.policy_type
  resource_id        = aws_appautoscaling_target.this.resource_id
  scalable_dimension = aws_appautoscaling_target.this.scalable_dimension
  service_namespace  = aws_appautoscaling_target.this.service_namespace

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageCPUUtilization"
    }
    target_value       = var.app_autoscaling_policy.cpu_target
    scale_in_cooldown  = var.app_autoscaling_policy.scale_in_cooldown
    scale_out_cooldown = var.app_autoscaling_policy.scale_out_cooldown
  }
}


resource "aws_appautoscaling_policy" "memory" {
  name               = "${aws_ecs_service.this.name}-memory-scaling"
  policy_type        = var.app_autoscaling_policy.policy_type
  resource_id        = aws_appautoscaling_target.this.resource_id
  scalable_dimension = aws_appautoscaling_target.this.scalable_dimension
  service_namespace  = aws_appautoscaling_target.this.service_namespace

  target_tracking_scaling_policy_configuration {

    predefined_metric_specification {
      predefined_metric_type = "ECSServiceAverageMemoryUtilization"
    }

    target_value       = var.app_autoscaling_policy.memory_target
    scale_in_cooldown  = var.app_autoscaling_policy.scale_in_cooldown
    scale_out_cooldown = var.app_autoscaling_policy.scale_out_cooldown
  }
}

