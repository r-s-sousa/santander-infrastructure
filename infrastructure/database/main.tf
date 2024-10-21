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
  max_allocated_storage                 = 15
  performance_insights_enabled          = false
  deletion_protection                   = false
  tags                                  = var.tags
}
