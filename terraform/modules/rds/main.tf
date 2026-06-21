resource "aws_db_subnet_group" "main" {
  name       = "${var.project_name}-${var.environment}-db-subnet-group"
  subnet_ids  = var.private_subnet_ids

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-subnet-group"
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_db_parameter_group" "main" {
  name        = "${var.project_name}-${var.environment}-db-parameter-group"
  family      = "postgres18"
  description = "Custom parameter group for ${var.project_name} ${var.environment} postgres 18 R1"

  tags = {
    Name        = "${var.project_name}-${var.environment}-db-parameter-group"
    Environment = var.environment
    Project     = var.project_name
  }

  lifecycle {
    create_before_destroy = true
  }
}  

resource "aws_db_instance" "main" {
  identifier = "${var.project_name}-${var.environment}-db"

  # Engine configuration
  engine         = "postgres"
  engine_version = var.db_engine_version
  instance_class = var.db_instance_class

  # Database configuration
  db_name  = var.db_name
  username = var.db_username
  password = var.db_password

  # Storage configuration
  allocated_storage     = var.db_allocated_storage
  max_allocated_storage = var.max_allocated_storage
  storage_type          = "gp3"
  storage_encrypted     = true

  # Network configuration
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.database_security_group_id]
  publicly_accessible    = false

  # Backup and maintenance
#   backup_retention_period = var.backup_retention_period
  backup_window           = "03:00-04:00" # UTC
  maintenance_window      = "Mon:04:00-Mon:05:00"

  # High availability
  multi_az = var.db_multi_az

  # Protection
  deletion_protection = var.deletion_protection
  skip_final_snapshot = var.skip_final_snapshot

  # Parameter group
  parameter_group_name = aws_db_parameter_group.main.name

  # Auto minor version upgrades
  auto_minor_version_upgrade = true

  tags = {
    Name = "${var.project_name}-${var.environment}-postgres"
  }
}
