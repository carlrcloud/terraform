terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}


#declare the data sources


# Configure the AWS Provider
provider "aws" {
  region  = "us-west-2"
  profile = "tf-cli-west2"
}
resource "aws_instance" "amason_linux_ec2_az_2a" {
  ami               = "ami-098e42ae54c764c35"
  instance_type     = "t2.micro"
  key_name          = "terraform-code-key"
  availability_zone = "us-west-2a"

  tags = {
    Name = "amason_linux_ec2_az_2a"
  }
}
resource "aws_security_group" "SG_ssh" {
  name        = "SG_ssh"
  description = "Allow ssh, http and https inbound traffic"


  ingress {
    description = "allow https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"

  }

  ingress {
    description = "allow https"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  ingress {
    description = "allow https"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }


  tags = {
    Name = "SG_ssh"
  }
}

