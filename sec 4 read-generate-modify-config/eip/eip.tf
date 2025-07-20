provider "aws" {       # This block tells Terraform to use AWS as the cloud provider
  region = "us-east-1" # Set the AWS region to us-east-1 (N.Virginia)

}

resource "aws_eip" "lb" { # Create an Elastic IP (EIP) resource named "lb"
  domain = "vpc"          # Specify the EIP if for use in a Virtual Private Cloud
}
