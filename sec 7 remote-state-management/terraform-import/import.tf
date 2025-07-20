# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Import Block (Terraform 1.5+ feature)
# Brings an existing security group into Terraform's state

import {
  to = aws_security_group.mysg # Target resource name in Terraform
  id = "sg-0a6af89e9042eb62c"  # Existing AWS Security Group ID (created manually via Console)
}

# This tells Terraform: “Bring this AWS resource under control and map it to the aws_security_group.mysg block.”
