resource "aws_db_subnet_group" "my_db_subnet_group" {
  name       = "my-db-subnet-group"
  subnet_ids = [join(" ", var.privat_ids)]

  tags = {
    Name = "My DB Subnet Group"
  }
}
