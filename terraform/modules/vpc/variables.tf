variable "project_name" {
  description = "The name of the project. This will be used as a prefix for all resources created."
  type        = string
  
}

variable "environment" {
  description = "The environment in which the project is deployed."
  type        = string
  
}

variable "vpc_cidr" {
    description = "The CIDR block for the VPC."
    type        = string
    default     = "10.0.0.0/16"
  
}

variable "public_subnet_cidrs" {
    description = "A list of CIDR blocks for the public subnets."
    type        = list(string)
    default     = ["10.0.1.0/24", "10.0.2.0/24"]
  
}

variable "private_subnet_cidrs" {
    description = "A list of CIDR blocks for the private subnets."
    type        = list(string)
    default     = ["10.0.10.0/24", "10.0.11.0/24"]
  
}

variable "aws_availability_zones" {
    description = "A list of availability zones to use for the subnets."
    type        = list(string)
    default     = ["eu-north-1a", "eu-north-1b"]
}