#trivy:ignore:AWS-0053
resource "aws_lb" "this" {
  name                             = var.alb.name
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = var.alb.security_groups
  subnets                          = var.alb.public_subnets
  enable_deletion_protection       = var.alb.enable_deletion_protection
  enable_cross_zone_load_balancing = true
  ip_address_type                  = var.alb.ip_address_type
  drop_invalid_header_fields       = true

  access_logs {
    bucket  = aws_s3_bucket.this.bucket
    prefix  = "alb-access-logs"
    enabled = var.alb.access_logs.enabled
  }
}