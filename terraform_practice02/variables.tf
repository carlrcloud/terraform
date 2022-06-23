#declare our variables for dynamic code

variable "aws_region" {
  type        = string
  description = "define the auto region"
 
}

variable "types" {
  type        = map(any)
  description = "define the type of the instance"
  

}
variable "keys" {
  type        = string
  description = "key name"
 


}

variable "server" {
  type    = list(any)
  

}

variable "AZs" {
  description = "define az"
  type        = string

}

variable "termination" {
  type    = bool
 

}

variable "ingress_desc" {
    description = "inbound traffic"
    type = map

  
}

variable "ingress_numb" {
    type = list

  
}

variable "engress" {
  type = list

}

variable "vpc_cidr" {
  type = string

}

variable "sg_tag" {
  type = map

}