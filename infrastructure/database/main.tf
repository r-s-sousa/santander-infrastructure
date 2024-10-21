resource "aws_db_instance" "db" {
  allocated_storage                     = var.db_allocated_storage
  engine                                = var.db_engine
  instance_class                        = var.db_instance_class
  identifier                            = var.db_identifier
  db_name                               = var.db_name
  username                              = var.db_username
  password                              = random_password.rds_password.result
  db_subnet_group_name                  = aws_db_subnet_group.main.name
  vpc_security_group_ids                = [aws_security_group.rds.id]
  multi_az                              = var.environment == "production" ? true : false
  publicly_accessible                   = var.publicly_accessible
  skip_final_snapshot                   = var.skip_final_snapshot
  backup_retention_period               = var.environment == "production" ? 14 : 7
  backup_window                         = "03:00-04:00"
  max_allocated_storage                 = var.environment == "production" ? 20 : 15
  performance_insights_enabled          = var.performance_insights_enabled
  performance_insights_retention_period = var.performance_insights_retention_period
  monitoring_interval                   = var.monitoring_interval
  monitoring_role_arn                   = aws_iam_role.rds_monitoring.arn
  deletion_protection                   = true
  kms_key_id                            = aws_kms_key.rds_key.arn
  storage_encrypted                     = true
  tags                                  = var.tags
}
