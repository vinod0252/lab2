resource "aws_nat_gateway" "NGW4" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet1.id

  tags = {
    Name = "NGW4"
  }
}
