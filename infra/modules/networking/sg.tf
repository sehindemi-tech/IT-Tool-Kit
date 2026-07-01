resource "aws_security_group" "endpoints_sg" {
  name        = var.vpc_endpoints_sg.name
  description = var.vpc_endpoints_sg.description
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-vpc-endpoints"
  }

}

resource "aws_vpc_security_group_ingress_rule" "endpoints_sg_ingress" {
  from_port         = var.vpc_endpoints_sg.from_port
  to_port           = var.vpc_endpoints_sg.to_port
  ip_protocol       = var.vpc_endpoints_sg.ip_protocol
  cidr_ipv4         = aws_vpc.this.cidr_block
  security_group_id = aws_security_group.endpoints_sg.id
}