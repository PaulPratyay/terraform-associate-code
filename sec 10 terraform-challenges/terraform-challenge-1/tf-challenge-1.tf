# AWS Provider Configuration (updated syntax)

provider "aws" {
  region = "us-east-1"



}

# Terraform Block: Required Provider Versions

terraform {
  required_providers {
    digitalocean = { # Declare the DigitalOcean provider using modern syntax
      source = "digitalocean/digitalocean"
      # We can specify a version here if needed, e.g., version = "~> 2.0"

    }
  }
}

# DigitalOcean Provider Block

provider "digitalocean" {

}

# AWS Elastic IP (EIP) Resource

resource "aws_eip" "my_eip" {
  domain = "vpc"

}

