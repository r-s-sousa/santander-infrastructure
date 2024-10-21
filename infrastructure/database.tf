module "db" {
  source             = "./rds"
  application_name   = var.application_name
  db_identifier      = var.db_identifier
  db_name            = var.application_name
  tags               = merge(var.tags, local.tags)
  environment        = var.environment
  vpc_id             = var.vpc_id
  availability_zones = var.availability_zones
}
