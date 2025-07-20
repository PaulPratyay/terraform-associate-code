# Configure the AWS provider with region

provider "aws" {
  region     = "us-east-1"                              # AWS region where resources will be created
  access_key = "**************************************" # Your AWS access key (should be stored securely)
  secret_key = "**************************************" # Your AWS secret key (should also be stored securely)

}

# Create an EC2 instance on AWS

resource "aws_instance" "ec2" {
  ami           = "ami-0953476d60561c955" # Amazon Machine Image ID to use for the instance
  instance_type = "t2.micro"              # Instance type (t2.micro is free-tier eligible)

  tags = {
    Name = "Elastic Compute Cloud" # Assign a name tag to the instance
  }
}

# Configure the Azure provider (no configuration yet, will use environment variables or defaults)

provider "azurerm" {}



