resource "aws_eip" "nat" {
  domain = "vpc"

  tags = merge(var.tags, {
    Name = "${var.name}-eip"
  })
}

resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id
  subnet_id     = var.public_subnet

  tags = {
    Name = var.name
  }
}

resource "aws_route" "private_nat" {

  route_table_id         = var.private_route_table
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat.id
}