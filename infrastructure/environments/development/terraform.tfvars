tags = {
  Environment = "development"
}
application_name   = "address-api"
container_port     = 8080
environment        = "development"
availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
db_identifier      = "address-db-instance"
db_name            = "address"
vpc_id             = "vpc-0a2f5fe3edf6b92b0"
redis_cluster_name = "redis-memorydb-cluster"
