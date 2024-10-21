resource "aws_kms_key" "rds_key" {
  description         = "KMS key for RDS encryption"
  enable_key_rotation = true

  tags = var.tags
}

resource "aws_kms_alias" "rds_key_alias" {
  name          = "alias/${var.db_identifier}-kms-key"
  target_key_id = aws_kms_key.rds_key.key_id
}

resource "random_password" "rds_password" {
  length           = 40
  special          = false
  min_special      = 5
  override_special = "!#$%^&*()-_=+[]{}<>:?"
  keepers = {
    pass_version = 1
  }
}
