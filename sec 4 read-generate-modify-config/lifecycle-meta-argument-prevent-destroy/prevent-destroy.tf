# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance named "DevOps" with destroy protection 

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  tags = {
    Name = "DevOps"
  }

  # Lifecycle block to protect this resource from accidental deletion

  lifecycle {

    # Prevent this resource from being destroyed by Terraform
    # If someone runs `terraform destroy` or tries to recreate this instance,
    # Terraform will throw an error and refuse to delete it

    prevent_destroy = true
  }

}
