# Define Required Provider and AWS Provider Block

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws" # Specifies AWS provider source


    }
  }
}

provider "aws" {
  region = "us-east-1" # Set region for all AWS resources
}

