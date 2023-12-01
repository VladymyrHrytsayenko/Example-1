variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "public_cidr" {
  default = [
  ]

}

variable "privat_cidr" {
  default = [
    "10.0.11.0/24",
    "10.0.17.0/24"
  ]
}
