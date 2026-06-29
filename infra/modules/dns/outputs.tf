output "zone_id" {
  description = "Zone ID of the hosted zone"
  value       = aws_route53_zone.this.zone_id
}

output "zone_name" {
  description = "Zone name of the hosted zone"
  value       = aws_route53_zone.this.name
}

output "zone_name_servers" {
  description = "Zone hosted name servers"
  value       = aws_route53_zone.this.name_servers
}