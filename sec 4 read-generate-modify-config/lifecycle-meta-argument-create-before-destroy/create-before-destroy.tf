# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance with a custom lifecycle configuration

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  # Add a Name tag for easier identification in the AWS Console

  tags = {
    Name = "MyEC2"
  }

  # Lifecycle block: Controls how Terraform handles changes to this resource

  lifecycle {
    # Tells Terraform to create the new EC2 instance before destroying the old one
    # This prevents downtime when the EC2 configuration changes (like AMI or type)
    create_before_destroy = true
  }

}

/*

=> Example Scenario:

  -> If we change the AMI or instance type:

    -> Normally: Terraform would destroy the old instance, then create a new one → downtime 

    -> With create_before_destroy = true: Terraform will create the new instance first, then delete the old one → no downtime 
    
*/

