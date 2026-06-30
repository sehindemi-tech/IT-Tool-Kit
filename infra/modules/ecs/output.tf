output "ecs_security_group" {
  description = "ECS security group ID"
  value       = aws_security_group.this.id
}