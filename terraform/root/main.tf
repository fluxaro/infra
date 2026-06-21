module "core" {
  source       = "../modules/core"
  project_name = var.project_name
  environment  = var.environment

}

module "vpc" {
  source       = "../modules/vpc"
  project_name = var.project_name
  environment  = var.environment
  vpc_cidr     = var.vpc_cidr

  # Use the first 2 availability zones from the core module for the VPC subnets
  aws_availability_zones = slice(module.core.availability_zones, 0, 2)
}

module "security_groups" {
  source       = "../modules/security_groups"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id

  # Allow SSH from anywhere (for testing purposes, should be restricted in production)
  allowed_ssh_cidrs = ["0.0.0.0/0"]
}

module "ec2" {
  source            = "../modules/ec2"
  project_name      = var.project_name
  environment       = var.environment
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  frontend_sg_id    = module.security_groups.frontend_security_group_id
  backend_sg_id     = module.security_groups.backend_security_group_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  ami_id            = module.core.ubuntu_ami_id
}

module "rds" {
  source                     = "../modules/rds"
  project_name               = var.project_name
  environment                = var.environment
  vpc_id                     = module.vpc.vpc_id
  private_subnet_ids         = module.vpc.private_subnet_ids
  database_security_group_id = module.security_groups.database_security_group_id
  db_instance_class          = var.db_instance_class
  db_name                    = var.db_name
  db_username                = var.db_username
  db_password                = var.db_password
}