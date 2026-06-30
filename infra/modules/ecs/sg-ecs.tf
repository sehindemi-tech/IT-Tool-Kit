resource "aws_security_group" "this" {
  name        = var.ecs_security_group.name
  description = var.ecs_security_group.description
  vpc_id      = var.ecs_security_group.vpc_id
}

resource "aws_vpc_security_group_ingress_rule" "alb_to_ecs" {
  from_port         = var.ecs_security_group.ingress_rule.from_port
  to_port           = var.ecs_security_group.ingress_rule.to_port
  ip_protocol       = var.ecs_security_group.ingress_rule.ip_protocol
  cidr_ipv4         = var.ecs_security_group.ingress_rule.cidr_ipv4
  security_group_id = aws_security_group.this.id
}

resource "aws_vpc_security_group_egress_rule" "ecs_to_aws_services" {
  security_group_id = aws_security_group.this.id
  cidr_ipv4         = var.ecs_security_group.egress_rule.cidr_ipv4
  from_port         = var.ecs_security_group.egress_rule.from_port
  to_port           = var.ecs_security_group.egress_rule.to_port
  ip_protocol       = var.ecs_security_group.egress_rule.ip_protocol
}

