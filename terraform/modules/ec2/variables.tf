variable "project_name" {
    description = "The name of the project."
    type        = string    
}

variable "environment" {
    description = "The environment (e.g., dev, staging, prod)."
    type        = string    
}

variable "vpc_id" {
    description = "The ID of the VPC where the EC2 instances will be launched."
    type        = string
}

variable "public_subnet_ids" {
    description = "A list of public subnet IDs where the EC2 instances will be launched."
    type        = list(string)
}

variable "frontend_sg_id" {
    description = "The ID of the security group for frontend instances."
    type        = string
}

variable "backend_sg_id" {
    description = "The ID of the security group for backend instances."
    type        = string
}

variable "instance_type" {
    description = "The type of EC2 instance to launch (e.g., t3.micro)."
    type        = string
    default     = "t3.micro"
}

variable "key_name" {
    description = "The name of the SSH key pair to use for the EC2 instances."
    type        = string
}

variable "ami_id" {
    description = "The ID of the AMI to use for the EC2 instances."
    type        = string 
}