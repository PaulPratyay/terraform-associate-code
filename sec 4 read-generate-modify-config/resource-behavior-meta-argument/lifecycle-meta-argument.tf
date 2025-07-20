# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance with custom tags

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev"
  }

  # - Terraform will ignore any future changes to the 'tags' field
  # - If we manually change tags in the AWS console, Terraform won’t try to revert them
  # - This is useful when tags are managed outside Terraform or frequently updated manually

  lifecycle {
    ignore_changes = [tags]
  }

}
