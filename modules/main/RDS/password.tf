resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_ssm_parameter" "DB_password" {
  name  = "Password"
  type  = "SecureString"
  value = random_password.password.result
}
