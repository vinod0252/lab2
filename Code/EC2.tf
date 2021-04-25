
resource "aws_instance" "VM1" {
  ami           = "ami-08962a4068733a2b6"
  instance_type = "t2.micro"
  user_data = data.template_file.user_data.rendered
  network_interface {
    network_interface_id = aws_network_interface.nic1.id
    device_index         = 0
  }
  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_instance" "VM2" {
  ami           = "ami-01e7ca2ef94a0ae86"
  instance_type = "t2.micro"
  user_data = data.template_file.user_data.rendered

  network_interface {
    network_interface_id = aws_network_interface.nic2.id
    device_index         = 0
  }
  tags = {
    Name = "This is chitti "
  }
}

resource "aws_network_interface" "nic1" {
  subnet_id   = aws_subnet.private_subnet1.id
  #private_ips = ""

  tags = {
    Name = "primary_network_interface_1"
  }
}

resource "aws_network_interface" "nic2" {
  subnet_id   = aws_subnet.private_subnet2.id
  #private_ips = ""

  tags = {
    Name = "primary_network_interface_2"
  }
}