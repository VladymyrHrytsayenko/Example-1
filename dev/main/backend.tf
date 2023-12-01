terraform {
  backend "s3" {
    bucket         = "aws-terraform-state-backend"
    key            = "backend/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "aws-terraform-state-locks"
    encrypt        = true
  }
}
