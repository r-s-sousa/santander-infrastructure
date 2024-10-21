module "application" {
  source            = "./application"
  tags              = merge(var.tags, local.tags)
  vpc_id            = module.network.vpc_id
  application_name  = "${var.application_name}-${var.environment}"
  public_subnet_ids = module.network.public_subnet_ids
}
