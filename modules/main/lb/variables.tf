variable "security_groups" {
  default = "aws_security_group.MainSG.id"
}

variable "subnets" {
  default = "element(var.public_cidr, count.index)"
}

variable "domain_name" {
  default = "example.com"
}

variable "vpc_id" {
  default = "aws_vpc.main.id"
}

variable "domain_name_app2" {
  default = "example.com/app2"
}

variable "domain_name_app3" {
  default = "example.com/app3"
}
