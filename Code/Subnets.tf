resource "aws_subnet" "public_subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "178.16.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "public_subnet1"
  }
}
resource "aws_subnet" "public_subnet2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "178.16.1.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "public_subnet2"
  }
}
resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "178.16.2.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "private_subnet1"
  }
}
resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = "178.16.3.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "private_subnet2"
  }
}
