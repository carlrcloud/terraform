terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "us-west-2"
  profile = "tf-cli-west2"
}
resource "aws_instance" "linux2" {
  ami           = "ami-0ca285d4c2cda3300"
  instance_type = "t2.micro"
  key_name = "terraform-code-key"
  availability_zone = "us-west-2b"

  tags = {
    Name = "linux_ec2_server"
  }
}
resource "aws_default_subnet" "default_az1" {
  availability_zone = "us-west-2b"
}
