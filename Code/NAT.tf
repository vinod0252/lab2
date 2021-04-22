resource "aws_nat_gateway" "NGW4" {
  allocation_id = data.aws_eip.by_allocation_id.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "NGW4"
  }
}
