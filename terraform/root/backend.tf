terraform {
  backend "s3" {
    bucket         = "taskapp-phoenix-terraform-state"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    dynamodb_table = "taskapp-phoenix-terraform-state-lock"
    encrypt        = true
  }
}