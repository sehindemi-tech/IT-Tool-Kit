resource "aws_security_group" "endpoints_sg" {
  name        = var.vpc_endpoints_sg.name
  description = var.vpc_endpoints_sg.description
  vpc_id      = aws_vpc.this.id
  tags = {
    Name = "${var.project_name}-vpc-endpoints"
  }
}

