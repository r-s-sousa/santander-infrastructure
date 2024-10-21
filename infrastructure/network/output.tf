output "vpc_id" {
  description = "The ID of the main VPC"
  value       = data.aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for s in data.aws_subnet.private : s.id]
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for s in data.aws_subnet.public : s.id]
}

output "private_subnet_cidrs" {
  description = "The CIDR blocks of the private subnets"
  value       = [for s in data.aws_subnet.private : s.cidr_block]
}

output "instance_security_group_ids" {
  description = "The security group IDs for instances"
  value       = data.aws_security_groups.instances.ids
}

output "availability_zones" {
  description = "The availability zones in use"
  value       = var.availability_zones
}