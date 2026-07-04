output "ecs_security_group" {
  description = "ECS security group ID"
  value       = aws_security_group.this.id
}

output "cluster_name" {
  description = "The name of the IT tools cluster"
  value       = aws_ecs_cluster.this.name
}

output "service_name" {
  description = "The name of the IT tools service"
  value       = aws_ecs_service.this.name
}