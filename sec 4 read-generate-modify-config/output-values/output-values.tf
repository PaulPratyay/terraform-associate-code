provider "aws" {
  region = "us-east-1"

}

resource "aws_eip" "lb" {
  domain = "vpc"

  tags = {
    Name = "abc"
  }

}

# Output block to display the public IP of the Elastic IP (aws_eip.lb)

output "public-ip" {
  value = aws_eip.lb.public_ip

}

# Output block to display the public IP in a full URL format with port 8080


output "public_ip" {
  value = "https://${aws_eip.lb.public_ip}:8080"

}

# Output block to display all attributes of the Elastic IP resource (aws_eip.lb)

output "public__ip" {
  value = aws_eip.lb

}
