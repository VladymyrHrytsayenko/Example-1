resource "aws_kms_key" "my_kms_key" {
  description             = "My KMS Key for RDS Encryption"
  deletion_window_in_days = 30

  tags = {
    Name = "MyKMSKey"
  }
}
