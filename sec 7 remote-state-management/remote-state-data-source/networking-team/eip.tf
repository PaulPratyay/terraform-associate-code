# Configure AWS Provider and Elastic IP Resource

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0" # ✅ Use the last known working version
    }
  }
}

# Create an Elastic IP (EIP) resource

resource "aws_eip" "my_eip" {
  domain = "vpc"

}

# Output the EIP public IP so it can be accessed by other modules or teams

output "eip_address" {
  value = aws_eip.my_eip.public_ip

}
