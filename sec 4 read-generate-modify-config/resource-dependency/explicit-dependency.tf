# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance
# Explicitly depends on an S3 bucket, even though it doesn't use it

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"
  depends_on    = [aws_s3_bucket.mys3_bucket] # Explicit dependency: Ensure the S3 bucket is created first

  # Even though the EC2 instance doesn't reference the bucket,
  # Terraform will wait for the bucket to be created before launching EC2
}

# Create an S3 bucket
# This is the resource the EC2 instance explicitly depends on

resource "aws_s3_bucket" "mys3_bucket" {
  bucket = "mysunflower-op-0219" # Name of the S3 bucket (must be globally unique)

}
