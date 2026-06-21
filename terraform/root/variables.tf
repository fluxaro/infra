variable "project_name" {
  description = "The name of the project in which to create the resources."
  type        = string
  default     = "taskapp-phoenix"
}

variable "environment" {
  description = "The environment in which to create the resources."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "The AWS region in which to create the resources."
  type        = string
  default     = "eu-north-1"
}

# Network variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"

}

#EC2 variables
variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "The name of the SSH key pair to use for the EC2 instance. It should be created in the AWS region specified by aws_region."
  type        = string
}

# RDS variables
variable "db_instance_class" {
  description = "The instance class for the RDS database."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "The name of the RDS database."
  type        = string
  default     = "taskapp"
}

variable "db_username" {
  description = "The Master username for the RDS database."
  type        = string
  default     = "taskapp_admin"
}

variable "db_password" {
  description = "The password for the RDS database. Master password for PostgreSQL database."
  type        = string
}

