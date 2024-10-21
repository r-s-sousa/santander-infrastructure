variable "application_name" {
  description = "Application Name"
  nullable    = false
  type        = string
}

variable "redis_cluster_name" {
  description = "The name of the MemoryDB cluster"
  nullable    = false
  type        = string
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  nullable    = false
  type        = string
}

variable "tags" {
  description = "Resource tags"
  nullable    = false
  type        = map(string)
}

variable "acl_name" {
  description = "Access control list name for MemoryDB"
  default     = "open-access"
  type        = string
}

variable "cache_instance_class" {
  description = "The instance class for the MemoryDB cluster"
  default     = "db.t4g.small"
  type        = string
}

# VPC ID for the cache cluster
variable "vpc_id" {
  description = "The VPC ID where the cache cluster will be deployed"
  type        = string
  nullable    = false
}

variable "private_subnet_ids" {
  description = "The private subnet IDs for the cache cluster"
  type        = list(string)
  nullable    = false
}

variable "security_group_ids" {
  description = "The security group IDs for the cache cluster"
  type        = list(string)
  nullable    = false
}

variable "availability_zones" {
  description = "The availability zones for the cache cluster"
  type        = list(string)
  nullable    = false
}