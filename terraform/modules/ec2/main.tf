resource "aws_instance" "frontend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.frontend_sg_id]

  # For public subnets, we need to associate a public IP address
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted = true
    delete_on_termination = true


    tags = {
        Name = "${var.project_name}-${var.environment}-frontend-root"
      
    }
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-frontend"
    Role        = "frontend"
    Component   = "web-server"
    AnsibleManaged = "true"
    }


  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "backend" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.public_subnet_ids[1]
  vpc_security_group_ids = [var.backend_sg_id]

  # For public subnets, we need to associate a public IP address
  associate_public_ip_address = true

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
    encrypted = true
    delete_on_termination = true

    tags = {
        Name = "${var.project_name}-${var.environment}-backend-root"
      
    }
  }

  tags = {
    Name        = "${var.project_name}-${var.environment}-backend"
    Role        = "backend"
    Component   = "application-server"
    AnsibleManaged = "true"
  }
   lifecycle {
    create_before_destroy = true
    }
}