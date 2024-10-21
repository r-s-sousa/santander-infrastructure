variable "publicly_accessible" {
  description = "RDS Publicly accessible"
  default     = false
  nullable    = false
  type        = bool
}

variable "db_username" {
  description = "The username for the RDS instance"
  default     = "address_user"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS instance"
  default     = "db.t3.micro"
  type        = string
}

variable "db_engine" {
  description = "The engine for the RDS instance"
  default     = "postgres"
  type        = string
}

variable "performance_insights_enabled" {
  description = "Enable Performance Insights"
  default     = true
  type        = bool
}

variable "performance_insights_retention_period" {
  description = "The retention period for the performance insights"
  default     = 7
  type        = number
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected."
  default     = 60
  type        = number
}

variable "skip_final_snapshot" {
  description = "Skip Final DB Snapshot"
  default     = true
  type        = bool
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS instance"
  default     = 10
  type        = number
}

variable "environment" {
  description = "Environment (e.g., dev, prod)"
  nullable    = false
  type        = string
}

variable "db_identifier" {
  description = "The name for the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The name for the initial database"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  nullable    = false
  type        = map(string)
}

variable "vpc_id" {
  description = "The VPC ID where the database instance will be deployed"
  type        = string
  nullable    = false
}

variable "private_subnet_ids" {
  description = "The private subnet IDs for the database instance"
  type        = list(string)
  nullable    = false
}

variable "security_group_ids" {
  description = "The security group IDs for the database instance"
  type        = list(string)
  nullable    = false
}

variable "availability_zones" {
  description = "The availability zones for the database instance"
  type        = list(string)
  nullable    = false
}
