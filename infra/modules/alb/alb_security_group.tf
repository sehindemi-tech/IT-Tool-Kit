resource "aws_security_group" "this" {
  name        = var.alb_sg.name
  description = var.alb_sg.description
  vpc_id      = var.alb_sg.vpc_id
  tags = {
    Name = "${var.project_name}-alb-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_ingress_internet" {
  for_each          = var.alb_sg.ingress_rule
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
  security_group_id = aws_security_group.this.id
}

resource "aws_vpc_security_group_egress_rule" "alb_egress_ecs_task" {
  for_each          = var.alb_sg.egress_rule
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  ip_protocol       = each.value.ip_protocol
  cidr_ipv4         = each.value.cidr_ipv4
  security_group_id = aws_security_group.this.id
}

