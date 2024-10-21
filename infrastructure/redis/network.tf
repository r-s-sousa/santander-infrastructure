resource "aws_security_group" "memorydb_sg" {
  name   = "${var.redis_cluster_name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.security_group_ids
    content {
      from_port       = 6379
      to_port         = 6379
      protocol        = "tcp"
      security_groups = [ingress.value]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}