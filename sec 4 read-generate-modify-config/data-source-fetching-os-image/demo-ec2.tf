# Specify the AWS provider and region to deploy resources

provider "aws" {
  region = "ap-south-1"

}

# Use a data source to fetch the latest Ubuntu OS image (AMI) from AWS

data "aws_ami" "myimage" {
  most_recent = true       # Get the most recently created image that matches the filter
  owners      = ["amazon"] # Only look for AMIs owned by Amazon (official images)

  # Define filter to search for a specific image name pattern

  filter {
    name   = "name"                                                          # Match based on the AMI's "name" property
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"] # This pattern matches AMIs for Ubuntu 24.04 (Noble), 64-bit, using GP3 SSD
  }

}

# Create an EC2 instance using the fetched AMI from the data source

resource "aws_instance" "myec2" {
  ami           = data.aws_ami.myimage.image_id # Use the AMI ID fetched above
  instance_type = "t2.micro"                    # Use a small, free-tier eligible instance type

}
