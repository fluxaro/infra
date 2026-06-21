provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "DevOps-phoenix" # Replace with your name or team name
      CreatedBy   = "Terraform"

    }
  }
  retry_mode  = "standard"
  max_retries = 5
}
