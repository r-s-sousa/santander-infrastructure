output "rds_host" {
  value = aws_db_instance.db.address
}

output "rds_db_name" {
  value = aws_db_instance.db.db_name
}

output "rds_port" {
  value = aws_db_instance.db.port
}

output "rds_db_user" {
  value     = "${aws_db_instance.db.username}"
  sensitive = false
}

output "rds_db_password" {
  value     = random_password.rds_password.result
  sensitive = true
}
