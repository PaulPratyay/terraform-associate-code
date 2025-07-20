# Specify the required AWS provider and lock its version

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}

# Call the official EC2 Instance Module from the Terraform Registry


module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws" # Source: Public module from Terraform Registry
  version = "5.8.0"                                  # Use version 5.8.0 of this EC2 module
}

# You should provide input variables here, like:
#   name           = "my-instance"
#   ami            = "ami-xyz"
#   instance_type  = "t2.micro"
#   subnet_id      = "subnet-abc"
#   vpc_security_group_ids = ["sg-123"]

# Right now, you're calling the module without passing inputs,
# so it will fail unless the module provides defaults for required inputs.
