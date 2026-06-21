# Outputs for the Core module
output "aws_availability_zones" {
  description = "List of availability zones in the region"
  value       = module.core.availability_zones
}

output "ubuntu_ami_id" {
  description = "The ID of the latest Ubuntu 24.04 AMI in the specified region"
  value       = module.core.ubuntu_ami_id
}


# Outputs for the VPC module
output "vpc_id" {
  description = "ID of the VPC created"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR block of the VPC created"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "IDs of the public subnets created"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets created"
  value       = module.vpc.private_subnet_ids
}

output "internet_gateway_id" {
  description = "ID of the Internet Gateway created"
  value       = module.vpc.internet_gateway_id
}

output "nat_gateway_id" {
  description = "ID of the NAT Gateway created"
  value       = module.vpc.nat_gateway_id
}

output "nat_gateway_public_ip" {
  description = "Public IP address of the NAT Gateway"
  value       = module.vpc.nat_gateway_public_ip
}

# Outputs for the Security Groups module
output "frontend_security_group_id" {
  description = "ID of the frontend security group created"
  value       = module.security_groups.frontend_security_group_id
}

output "backend_security_group_id" {
  description = "ID of the backend security group created"
  value       = module.security_groups.backend_security_group_id
}

output "database_security_group_id" {
  description = "ID of the database security group created"
  value       = module.security_groups.database_security_group_id
}

#EC2 module outputs are defined in modules/ec2/outputs.tf and will be referenced in the root module as needed.
output "frontend_instance_id" {
  description = "The ID of the frontend EC2 instance."
  value       = module.ec2.frontend_instance_id

}

output "frontend_public_id" {
  description = "The public IP address of the frontend EC2 instance."
  value       = module.ec2.frontend_public_id

}

output "frontend_private_ip" {
  description = "The private IP address of the frontend EC2 instance."
  value       = module.ec2.frontend_private_ip

}

output "frontend_public_dns" {
  description = "The public DNS name of the frontend EC2 instance."
  value       = module.ec2.frontend_public_dns

}

output "backend_instance_id" {
  description = "The ID of the backend EC2 instance."
  value       = module.ec2.backend_instance_id

}

output "backend_public_id" {
  description = "The public IP address of the backend EC2 instance."
  value       = module.ec2.backend_public_id

}

output "backend_private_ip" {
  description = "The private IP address of the backend EC2 instance."
  value       = module.ec2.backend_private_ip

}

output "backend_public_dns" {
  description = "The public DNS name of the backend EC2 instance."
  value       = module.ec2.backend_public_dns

}

# RDS module outputs are defined in modules/rds/outputs.tf and will be referenced in the root module as needed.
output "db_instance_id" {
  description = "RDS instance ID"
  value       = module.rds.db_instance_id
}

output "db_endpoint" {
  description = "Database connection endpoint (sensitive — use for Ansible config)"
  value       = module.rds.endpoint
  sensitive   = true
}

output "db_address" {
  description = "Database hostname (without port)"
  value       = module.rds.address
  sensitive   = true
}

output "db_port" {
  description = "Database port"
  value       = module.rds.port
}

output "db_name" {
  description = "Database name"
  value       = module.rds.db_name
}

output "db_username" {
  description = "Database master username"
  value       = module.rds.username
  sensitive   = true
}

output "db_connection_string" {
  description = "Database connection string (sensitive — use for Ansible config)"
  value       = "${module.rds.username}:${var.db_password}@${module.rds.address}:${module.rds.port}/${module.rds.db_name}"
  sensitive   = true

}