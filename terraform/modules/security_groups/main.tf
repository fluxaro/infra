resource "aws_security_group" "frontend" {
  name        = "${var.project_name}-${var.environment}-frontend-sg"
  description = "Security group for frontend EC2 instances (Nginx)"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Allow HTTP traffic from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  
  }

  ingress {
    description      = "Allow HTTPS traffic from anywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }

  ingress {
    description      = "Allow SSH traffic from specified CIDR blocks"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.allowed_ssh_cidrs
  
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-frontend-sg"
  }

  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_security_group" "backend" {
  name        = "${var.project_name}-${var.environment}-backend-sg"
  description = "Security group for backend EC2 instance (Flask/Gunicorn)"
  vpc_id      = var.vpc_id

  ingress {
    description      = "Flask API from frontend security group"
    from_port        = 5000
    to_port          = 5000
    protocol         = "tcp"
    security_groups  = [aws_security_group.frontend.id]
  
  }

  ingress {
    description      = "Allow SSH traffic from specified CIDR blocks"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.allowed_ssh_cidrs
  
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-backend-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "database" {
  name        = "${var.project_name}-${var.environment}-rds-sg"
  description = "Security group for RDS database instance"
  vpc_id      = var.vpc_id

  ingress {
    description      = "PostgreSQL from backend security group"
    from_port        = 5432
    to_port          = 5432
    protocol         = "tcp"
    security_groups  = [aws_security_group.backend.id]
  
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-rds-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}