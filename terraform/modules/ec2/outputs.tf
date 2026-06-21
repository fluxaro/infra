output "frontend_instance_id" {
    description = "The ID of the frontend EC2 instance."
    value       = aws_instance.frontend.id
}

output "frontend_public_id" {
    description = "The public IP address of the frontend EC2 instance."
    value       = aws_instance.frontend.public_ip
  
}

output "frontend_private_ip" {
    description = "The private IP address of the frontend EC2 instance."
    value       = aws_instance.frontend.private_ip
  
}

output "frontend_public_dns" {
    description = "The public DNS name of the frontend EC2 instance."
    value       = aws_instance.frontend.public_dns
  
}

output "backend_instance_id" {
    description = "The ID of the backend EC2 instance."
    value       = aws_instance.backend.id
}

output "backend_public_id" {
    description = "The public IP address of the backend EC2 instance."
    value       = aws_instance.backend.public_ip
  
}

output "backend_private_ip" {
    description = "The private IP address of the backend EC2 instance."
    value       = aws_instance.backend.private_ip
  
}

output "backend_public_dns" {
    description = "The public DNS name of the backend EC2 instance."
    value       = aws_instance.backend.public_dns
  
}

