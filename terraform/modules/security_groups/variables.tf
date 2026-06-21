variable "project_name" {
    description = "The name of the project. This will be used as a prefix for all resources created."
    type = string
}

variable "environment" {
    description = "The environment in which the project is deployed."
    type = string
}

variable "vpc_id" {
    description = "The ID of the VPC in which to create the security groups."
    type = string
  
}

variable "allowed_ssh_cidrs" {
    description = "A list of CIDR blocks that are allowed to access the EC2 instances via SSH."
    type        = list(string)
    default     = ["0.0.0.0/0"]
  
}
