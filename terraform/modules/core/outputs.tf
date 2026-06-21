output "availability_zones" {
    description = "List of availability zones in the region"
    value       = data.aws_availability_zones.available.names
  
}

output "ubuntu_ami_id" {
    description = "The ID of the latest Ubuntu 24.04 AMI in the specified region"
    value       = data.aws_ami.ubuntu.id
}

output "ubuntu_ami_name" {
    description = "The name of the latest Ubuntu 24.04 AMI in the specified region"
    value       = data.aws_ami.ubuntu.name
  
}

output "current_account_id" {
    description = "The AWS account ID of the current caller"
    value       = data.aws_caller_identity.current.account_id
}

output "current_region" {
    description = "The AWS region in which the configuration is being applied"
    value       = data.aws_region.current.name
}

