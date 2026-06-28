resource "aws_vpc_endpoint" "interface_endpoint" {
  for_each            = var.interface_endpoint
  vpc_endpoint_type   = "Interface"
  vpc_id              = aws_vpc.this.id
  ip_address_type     = each.value.ip_address_type
  service_name        = each.value.service_name
  subnet_ids          = [for key, value in aws_subnet.this : value.id if !var.subnets[key].is_public]
  security_group_ids  = [aws_security_group.endpoints_sg.id]
  private_dns_enabled = true
  tags = {
    Name = "${var.project_name}-interface-endpoints"
  }
}

variable "interface_endpoint" {
  description = "Interface endpoint configuration"
  type = map(object({
    service_name    = string
    ip_address_type = optional(string, "ipv4")
  }))
}