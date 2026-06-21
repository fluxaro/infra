output "db_instance_id" {
  description = "ID of the RDS instance"
  value       = aws_db_instance.main.id
}

output "db_instance_arn" {
  description = "ARN of the RDS instance"
  value       = aws_db_instance.main.arn
}

output "endpoint" {
  description = "Connection endpoint (hostname:port) for the database"
  value       = aws_db_instance.main.endpoint
  sensitive   = true
}

output "address" {
  description = "Hostname of the database (without port)"
  value       = aws_db_instance.main.address
  sensitive   = true
}

output "port" {
  description = "Port number for database connections"
  value       = aws_db_instance.main.port
}

output "db_name" {
  description = "Name of the default database"
  value       = aws_db_instance.main.db_name
}

output "username" {
  description = "Master username for the database"
  value       = aws_db_instance.main.username
  sensitive   = true
}

output "db_subnet_group_name" {
  description = "Name of the DB subnet group"
  value       = aws_db_subnet_group.main.name
}

output "db_parameter_group_name" {
  description = "Name of the DB parameter group"
  value       = aws_db_parameter_group.main.name
}