# Environment Settings
variable "environment" {
  description = "The environment (e.g., dev, stage, prod)"
  type        = string
  nullable    = false
}

# Tags
variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  nullable    = false
}

# Availability Zones
variable "availability_zones" {
  description = "A list of availability zones"
  type        = list(string)
  nullable    = false
}

# VPC
variable "vpc_id" {
  description = "ID of the VPC where resources will be deployed"
  type        = string
  nullable    = false
}

# RDS Specific Variables
variable "db_identifier" {
  description = "The name for the RDS instance, used to uniquely identify it"
  type        = string
  nullable    = false
}

variable "db_name" {
  description = "The name for the initial database to create within the RDS instance"
  type        = string
  nullable    = false
}

variable "db_username" {
  description = "The master username for the RDS instance"
  type        = string
  default     = "address_user"
}

variable "db_instance_class" {
  description = "Instance class for the RDS instance (e.g., db.t3.micro)"
  type        = string
  default     = "db.t3.micro"
}

variable "db_engine" {
  description = "The engine type for the RDS instance (e.g., postgres)"
  type        = string
  default     = "postgres"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance in GB"
  type        = number
  default     = 10
}

variable "publicly_accessible" {
  description = "Whether the RDS instance should be publicly accessible"
  type        = bool
  default     = false
}

# RDS Performance Insights
variable "performance_insights_enabled" {
  description = "Whether to enable Performance Insights for RDS"
  type        = bool
  default     = true
}

variable "performance_insights_retention_period" {
  description = "The retention period for Performance Insights data in days"
  type        = number
  default     = 7
}

# Monitoring
variable "monitoring_interval" {
  description = "The interval in seconds between Enhanced Monitoring metrics collection"
  type        = number
  default     = 60
}

# Snapshot and Backup Configuration
variable "skip_final_snapshot" {
  description = "Whether to skip taking a final DB snapshot when deleting the instance"
  type        = bool
  default     = true
}

# Redis MemoryDB Specific Variables
variable "redis_cluster_name" {
  description = "The name of the Redis MemoryDB cluster"
  type        = string
  nullable    = false
}

variable "cache_instance_class" {
  description = "Instance class for the MemoryDB Redis cluster (e.g., db.t4g.small)"
  type        = string
  default     = "db.t4g.small"
}

# Application Specific Variables
variable "application_name" {
  description = "The name of the application using this infrastructure"
  type        = string
  default     = "address-service"
}

variable "container_port" {
  description = "The port exposed by the application container"
  type        = number
  default     = 8080
}
