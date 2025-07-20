# EC2 Module Definition: Declares resources to be reused as a module

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0"
    }
  }
}
# Create an EC2 instance using inputs provided by the calling module

resource "aws_instance" "myec2" {
  ami           = var.ami
  instance_type = var.instance_type

}
