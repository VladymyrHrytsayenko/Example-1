variable "owners" {
  default = ["137112412989"]
}

variable "values" {
  default = ["al2023-ami-*-kernel-6.1-x86_64"]

}

variable "instance" {
  default = "t2.micro"
}

variable "capacity" {
  default = "3"
}

variable "min" {
  default = "3"
}

variable "max" {
  default = "4"
}

variable "tags" {
  type = map(any)
  default = {
    Name   = "ClusterServer"
    Owner  = "MyServer"
    TAGKEY = "TAGVALUE"
  }
}


variable "SGroup_id" {
  default = "aws_security_group.MainSG.id"
}

variable "vpc_zone_identifier" {
  default = "element(var.public_cidr, count.index)"
}
