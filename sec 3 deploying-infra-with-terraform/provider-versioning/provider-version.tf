# This block sets version requirements for Terraform providers

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Specifies the official AWS provider from HashiCorp
      version = "~> 3.0"        # Allows any version >= 3.0.0 and < 4.0.0 (backward-compatible updates only)
    }
  }
}

# This block configures the AWS provider

provider "aws" {
  region = "us-east-1" # Sets the AWS region for your resources
}
