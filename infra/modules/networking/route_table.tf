resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project_name}-prublic-rt"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-private-rt"
  }
}

resource "aws_route_table_association" "public_rt_association" {
  for_each       = { for key, value in var.subnets : key => value if value.is_public }
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_rt_association" {
  for_each       = { for key, value in var.subnets : key => value if !value.is_public }
  subnet_id      = aws_subnet.this[each.key].id
  route_table_id = aws_route_table.private.id
}