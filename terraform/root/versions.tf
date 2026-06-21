terraform {
  # Specify the required Terraform version and providers to ensure compatibility and proper functioning of the configuration.
  # minimum required version of Terraform is set to 1.5.0, which ensures that users have a compatible version of Terraform installed to work with this configuration.
  required_version = ">= 1.5.0"

  required_providers {
    # AWS provider - our primary provider for managing AWS resources. 
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      # The Random provider is used for generating random values, which can be useful for creating unique resource names, passwords, or other random data needed in your infrastructure.
      source  = "hashicorp/random"
      version = "~> 3.0"
    }

    tls = {
      # The TLS provider is used for generating TLS certificates, which can be useful for securing communication between services or for other cryptographic operations.
      source  = "hashicorp/tls"
      version = "~> 4.0"
    }
  }
}