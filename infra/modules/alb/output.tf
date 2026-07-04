output "alb_security_group_id" {
  description = "ALB security group ID"
  value       = aws_security_group.this.id
}

output "target_group_arn" {
  description = "The ALB target group ARN"
  value       = aws_lb_target_group.this.arn
}

output "alb_dns_name" {
  description = "The name of the IT Tools ALB"
  value       = aws_lb.this.dns_name
}

output "alb_zone_id" {
  description = "The ALB zone ID "
  value       = aws_lb.this.zone_id
}

output "alb_arn" {
  description = "The ALB ARN"
  value       = aws_lb.this.arn
}