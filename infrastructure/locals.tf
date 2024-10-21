data "aws_caller_identity" "current" {}

locals {
  account_id = data.aws_caller_identity.current.account_id
  tags = {
    ApplicationName = var.application_name
    Env             = var.environment == "production" ? "prod" : "dev"
    Environment     = var.environment
    OwnerEmail      = "rafael_sousa2018@outlook.com"
    OwnerName       = "rafael sousa"
    Service         = var.application_name
    Terraform       = "true"
  }
  secrets = {
    DATABASE_USER     = module.db.rds_db_user
    DATABASE_PASSWORD = module.db.rds_db_password
  }
}
