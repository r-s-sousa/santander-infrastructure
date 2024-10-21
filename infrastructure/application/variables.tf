variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "key_name" {
  description = "Key name for EC2 instances"
  default     = "key-pair-address-service"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the resources"
  type        = map(string)
  nullable    = false
}

variable "application_name" {
  description = "Application Name"
  nullable    = false
  type        = string
}

variable "public_subnet_ids" {
  description = "The public subnet IDs for the ALB"
  type        = list(string)
  nullable    = false
}
