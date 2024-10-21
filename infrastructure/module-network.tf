module "network" {
  source             = "./network"
  application_name   = var.application_name
  vpc_id             = var.vpc_id
  availability_zones = var.availability_zones
}
