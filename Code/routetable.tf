resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.vpc1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw1.id
  }

  
  tags = {
    Name = "rt-public"
  }
}


resource "aws_route_table" "rt-private" {
  vpc_id = aws_vpc.vpc1.id

  
 route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.NGW4.id
  }
  

  tags = {
    Name = "rt2"
  }
}

resource "aws_route_table_association" "rt-assoc" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.rt-public.id
}

resource "aws_route_table_association" "rt-assoc2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.rt-public.id
}
resource "aws_route_table_association" "rt-assoc3" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.rt-private.id
}
resource "aws_route_table_association" "rt-assoc4" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.rt-private.id
}