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

data "aws_subnet" "public" {
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
    values = ["application"]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.main.id]
  }
}
