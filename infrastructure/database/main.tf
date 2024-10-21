resource "aws_db_instance" "db" {
  allocated_storage                     = 10
  engine                                = "postgres"
  instance_class                        = "db.t3.micro"
  identifier                            = var.db_identifier
  db_name                               = var.db_name
  username                              = var.db_username
  password                              = random_password.rds_password.result
  db_subnet_group_name                  = aws_db_subnet_group.main.name
  vpc_security_group_ids                = [aws_security_group.rds.id]
  multi_az                              = false
  publicly_accessible                   = false
  skip_final_snapshot                   = true
  backup_retention_period               = 7 
  backup_window                         = "03:00-04:00"
  max_allocated_storage                 = 15
  performance_insights_enabled          = false
  performance_insights_retention_period = 7
  monitoring_interval                   = 0
  monitoring_role_arn                   = null
  deletion_protection                   = false
  storage_encrypted                     = false
  tags                                  = var.tags
}
