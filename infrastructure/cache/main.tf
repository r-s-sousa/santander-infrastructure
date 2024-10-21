
resource "aws_memorydb_subnet_group" "main" {
  name       = "${var.redis_cluster_name}-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags       = var.tags
}

resource "aws_memorydb_cluster" "memorydb" {
  acl_name               = var.acl_name
  name                   = var.redis_cluster_name
  node_type              = var.cache_instance_class
  security_group_ids     = [aws_security_group.memorydb_sg.id]
  subnet_group_name      = aws_memorydb_subnet_group.main.name
  num_shards             = 1
  num_replicas_per_shard = 0
  tags                   = var.tags
}
