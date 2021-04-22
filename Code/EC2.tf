
resource "aws_instance" "VM1" {
  ami           = "ami-042e8287309f5df03"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}