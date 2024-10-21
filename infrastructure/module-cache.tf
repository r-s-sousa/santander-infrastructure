module "cache" {
  source             = "./cache"
  redis_cluster_name = var.redis_cluster_name
  application_name   = var.application_name
  tags               = merge(var.tags, local.tags)
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  security_group_ids = module.network.instance_security_group_ids
  availability_zones = module.network.availability_zones
}
