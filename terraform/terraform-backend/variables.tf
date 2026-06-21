variable "project_name" {
  description = "Project name used for backend resource naming"
  type        = string
  default     = "taskapp-phoenix"
}

variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-north-1"
}

variable "environment" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "dev"
}