
resource "aws_memorydb_subnet_group" "main" {
  name       = "${var.redis_cluster_name}-subnet-group"
  subnet_ids = values(data.aws_subnet.private)[*].id
  tags       = var.tags
}

resource "aws_memorydb_cluster" "memorydb" {
  acl_name           = var.acl_name
  name               = var.redis_cluster_name
  node_type          = var.cache_instance_class
  security_group_ids = [aws_security_group.memorydb_sg.id]
  subnet_group_name  = aws_memorydb_subnet_group.main.name
  tags               = var.tags
}
