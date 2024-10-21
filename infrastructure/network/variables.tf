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

variable "application_name" {
  description = "The name of the application using this infrastructure"
  nullable    = false
  type        = string
}
