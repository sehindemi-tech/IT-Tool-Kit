resource "aws_lb_target_group" "this" {
  name                              = var.alb_target_group.name
  port                              = var.alb_target_group.port
  protocol                          = var.alb_target_group.protocol
  target_type                       = var.alb_target_group.target_type
  vpc_id                            = var.alb_target_group.vpc_id
  load_balancing_cross_zone_enabled = var.alb_target_group.load_balancing_cross_zone_enabled
  ip_address_type                   = var.alb_target_group.ip_address_type


  health_check {
    enabled             = var.alb_target_group.health_check.enabled
    path                = var.alb_target_group.health_check.path
    port                = var.alb_target_group.health_check.port
    protocol            = var.alb_target_group.health_check.protocol
    matcher             = var.alb_target_group.health_check.matcher
    interval            = var.alb_target_group.health_check.interval
    timeout             = var.alb_target_group.health_check.timeout
    healthy_threshold   = var.alb_target_group.health_check.healthy_threshold
    unhealthy_threshold = var.alb_target_group.health_check.unhealthy_threshold
  }
}

