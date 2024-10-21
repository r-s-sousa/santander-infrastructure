terraform {
  required_version = ">= 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.34.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
}

module "network" {
  source             = "./network"
  application_name   = var.application_name
  vpc_id             = var.vpc_id
  availability_zones = var.availability_zones
}

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

module "db" {
  source             = "./database"
  application_name   = var.application_name
  db_identifier      = var.db_identifier
  db_name            = var.db_name
  tags               = merge(var.tags, local.tags)
  environment        = var.environment
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  security_group_ids = module.network.instance_security_group_ids
  availability_zones = module.network.availability_zones
}

# module "application" {
#   source            = "./application"
#   tags              = merge(var.tags, local.tags)
#   vpc_id            = module.network.vpc_id
#   application_name  = "${var.application_name}-${var.environment}"
#   public_subnet_ids = module.network.public_subnet_ids
# }
