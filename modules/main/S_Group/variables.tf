variable "alow_ports" {
  type    = list(any)
  default = ["80", "443", "179", "5432"]
}

variable "vpc_id" {
  default = ""
}
