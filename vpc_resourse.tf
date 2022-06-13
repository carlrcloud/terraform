resource "aws_vpc" "terra_vpc" {
  cidr_block       = "10.123.0.0/16"

  tags = {
    Name = "terra_vpc"
  }
}