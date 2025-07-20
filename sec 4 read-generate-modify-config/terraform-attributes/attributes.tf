# Configure AWS Provider 

provider "aws" {
  region = "us-east-1"

}

# Create an Elastic IP (EIP)

resource "aws_eip" "lb" {
  domain = "vpc"

}

# Create an EC2 Instance

resource "aws_instance" "ec2" {
  ami           = "ami-0953476d60561c955"
  instance_type = "t2.micro"

}
