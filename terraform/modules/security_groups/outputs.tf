output "frontend_security_group_id" {
    description = "ID of the frontend security group"
    value       = aws_security_group.frontend.id
  
}

output "backend_security_group_id" {
    description = "ID of the backend security group"
    value       = aws_security_group.backend.id
  
}

output "database_security_group_id" {
    description = "ID of the RDS security group"
    value       = aws_security_group.database.id
  
}