# Define the AWS provider and region

provider "aws" {
  region = "us-east-1"

}

# Using an official VPC module to create networking infrastructure

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" # Source of the module from Terraform Registry
  version = "5.13.0"                        #Version of the module

  name = "my-vpc"      # VPC name
  cidr = "10.0.0.0/16" # IP range for the whole VPC

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]          # Availability Zones
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]       # Private subnets
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] #Public subnets

  enable_nat_gateway = true # Allow internet access for private subnets
  enable_vpn_gateway = true # Setup for VPN connectivity

  tags = {
    Terraform   = "true"
    Environment = "dev" # Tagging environment
  }

}

# Create a security group (firewall) with name "terraform-firewall"

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed from Terraform"

}

# Ingress rule: Allow HTTP (port 80) from any IPv4 address

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

}

# Egress rule: Allow all outbound traffic from the security group

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # "-1" means all traffic

}


# Another security group created but not used yet

resource "aws_security_group" "allow_tls2" {
  name        = "terraform-firewalls"
  description = "Managed form Terraform"

}



/*

VPC Module Block

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"

-> This uses a pre-built module from the Terraform Registry (a reusable template).
-> The vpc module helps you quickly set up a Virtual Private Cloud.

  name     = "my-vpc"
  version  = "5.13.0"

-> name: This will be used to label the VPC.
-> version: Specifies the exact version of the module to use.

  cidr = "10.0.0.0/16"

-> Defines the IP range for the entire VPC.

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

-> azs: These are Availability Zones (data center locations in the region).
-> Creates 3 private and 3 public subnets spread across those AZs.

  enable_nat_gateway = true
  enable_vpn_gateway = true

-> enable_nat_gateway: Allows private subnets to access the internet.
-> enable_vpn_gateway: Prepares the VPC for VPN access.

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

-> Tags are useful for organization and billing in AWS. You’re marking these resources as part of a development environment created 
using Terraform.




*/
