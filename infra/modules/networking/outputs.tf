output "vpc_id" {
  description = "The VPC id"
  value       = aws_vpc.this.id
}

output "public_subnets_id" {
  description = "Public subnets IDs"
  value       = [for key, values in aws_subnet.this : values.id if var.subnets[key].is_public]
}

output "private_subnets_id" {
  description = "Private subnets IDs"
  value       = [for key, values in aws_subnet.this : values.id if !var.subnets[key].is_public]
}

output "endpoint_security_group_id" {
  description = "The endpoints security group id"
  value       = aws_security_group.endpoints_sg.id
}

output "private_route_table_id" {
  description = "Private route table id"
  value       = aws_route_table.private.id
}