
#declare data sources

data "aws_ami" "linux_server01" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }



}

data "aws_region" "current" {}


#declare our resources

resource "aws_instance" "linux_server01" {

  ami                     = data.aws_ami.linux_server01.id
  instance_type           = var.types["dev"]
  key_name                = var.keys
  vpc_security_group_ids  = [aws_security_group.ssh_sg1.id, aws_security_group.sg_web1.id]
  disable_api_termination = var.termination
  availability_zone       = var.AZs

  tags = {
    Name   = var.server[0]
    AZ     = var.AZs
    region = var.aws_region
  }

}

resource "aws_security_group" "ssh_sg1" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  #vpc_id      = aws_vpc.projet_terraform.id

  ingress {
    description = var.ingress_desc["desc_ssh"]
    from_port   = var.ingress_numb[1]
    to_port     = var.ingress_numb[1]
    protocol    = var.ingress_numb[3]
    cidr_blocks = [var.ingress_numb[4]]

  }

  egress {
    from_port   = var.engress[0]
    to_port     = var.engress[0]
    protocol    = var.engress[1]
    cidr_blocks = [var.ingress_numb[4]]

  }

  tags = {
    Name = var.sg_tag["ssh"]
  }

}

resource "aws_security_group" "sg_web1" {

  name        = "allow web"
  description = "Allow http inbound traffic"
  #vpc_id      = aws_vpc.projet_terraform.id

  ingress {
    description = var.ingress_desc["desc_web_mysql"]  #"allow http"
    from_port   = var.ingress_numb[0]   
    to_port     = var.ingress_numb[0]   
    protocol    = var.ingress_numb[3]   
    cidr_blocks = [var.ingress_numb[4]]   

  }

  ingress {
    description = var.ingress_desc["desc_web_mysql"]
    from_port   = var.ingress_numb[2]
    to_port     = var.ingress_numb[2]
    protocol    = var.ingress_numb[3]
    cidr_blocks = [var.ingress_numb[4]]
  }

  egress {
    from_port   = var.engress[0]
    to_port     = var.engress[0]
    protocol    = var.engress[1]
    cidr_blocks = [var.ingress_numb[4]]

  }

  tags = {
    Name = var.sg_tag["web"]
  }


}


resource "aws_vpc" "projet_terraform" {

  cidr_block = var.vpc_cidr
}

