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

variable "availability_zones" {
  description = "A list of availability zones"
  nullable    = false
  type        = list(string)
}

variable "vpc_id" {
  description = "Main VPC id"
  nullable    = false
  type        = string
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