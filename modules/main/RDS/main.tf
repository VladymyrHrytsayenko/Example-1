resource "aws_db_instance" "default" {
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  identifier        = "mydb"
  username          = "admin"
  password          = random_password.password.result

  vpc_security_group_ids = [var.vpc_security_group_ids]
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name

  backup_retention_period      = 7
  backup_window                = "03:00-04:00"
  maintenance_window           = "mon:04:00-mon:04:30"
  skip_final_snapshot          = false
  final_snapshot_identifier    = "my-db"
  monitoring_interval          = 60
  monitoring_role_arn          = aws_iam_role.rds_monitoring_role.arn
  performance_insights_enabled = true
  storage_encrypted            = true
  kms_key_id                   = aws_kms_key.my_kms_key.arn

}
