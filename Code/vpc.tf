resource "aws_vpc" "vpc1" {
  cidr_block       = "178.16.0.0/16"  # 172.16.0.0/24, 172.16.1.0/24, 172.16.2.0/24,  172.16.3.0/24
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames  = true

  tags = {
    Name = "vpc1"
  }
}