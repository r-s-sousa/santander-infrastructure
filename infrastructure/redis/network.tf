data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet" "private" {
  for_each = toset(var.availability_zones)

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }

  filter {
    name   = "availability-zone"
    values = [each.key]
  }
}

data "aws_security_groups" "instances" {
  filter {
    name   = "tag:ApplicationName"
    values = [var.application_name]
  }

  filter {
    name   = "tag:Category"
    values = ["ec2"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}

resource "aws_security_group" "memorydb_sg" {
  name   = "${var.redis_cluster_name}-sg"
  vpc_id = data.aws_vpc.main.id

  dynamic "ingress" {
    for_each = data.aws_security_groups.instances.ids
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
