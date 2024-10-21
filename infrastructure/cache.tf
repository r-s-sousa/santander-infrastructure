module "cache" {
  source             = "./redis"
  redis_cluster_name = var.redis_cluster_name
  application_name   = var.application_name
  tags               = merge(var.tags, local.tags)
  environment        = var.environment
  vpc_id             = var.vpc_id
  availability_zones = var.availability_zones
}
