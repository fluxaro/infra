variable "project_name" {
    description = "The name of the project."
    type        = string    
}

variable "environment" {
    description = "The environment (e.g., dev, staging, prod)."
    type        = string    
}

variable "vpc_id" {
    description = "The ID of the VPC."
    type        = string
}

variable "private_subnet_ids" {
    description = "A list of private subnet IDs where the RDS instance will be launched."
    type        = list(string)
  
}

variable "database_security_group_id" {
    description = "The ID of the security group for the RDS database."
    type        = string
}

variable "db_instance_class" {
    description = "The instance class for the RDS database (e.g., db.t3.micro)."
    type        = string
    default     = "db.t3.micro"
}

variable "db_name" {
    description = "The name of the database."
    type        = string
    default     = "taskapp"
}

variable "db_username" {
    description = "The master username for the RDS database."
    type        = string
    default     = "taskapp_admin"
}
variable "db_engine_version" {
    description = "The version of the database engine to use (e.g., 13.7, 12.8)."
    type        = string
    default     = "18.3"
}

variable "db_password" {
    description = "The master password for the RDS database."
    type        = string
    sensitive   = true
}

variable "db_allocated_storage" {
    description = "The allocated storage for the RDS database in GB."
    type        = number
    default     = 20
}

variable "db_backup_retention_period" {
    description = "The number of days to retain backups for the RDS database."
    type        = number
    default     = 7
}

variable "db_multi_az" {
    description = "Whether to create a Multi-AZ RDS database instance."
    type        = bool
    default     = false
}

variable "deletion_protection" {
  description = "Prevent accidental deletion of the database"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot when destroying (false = create snapshot)"
  type        = bool
  default     = true
}


variable "max_allocated_storage" {
    description = "The maximum allocated storage for the RDS database in GB."
    type        = number
    default     = 100
  
}

