# Configure remote backend to store state in an S3 bucket

terraform {
  backend "s3" {
    bucket = "mysunflower-1902" # Name of the S3 bucket storing state
    key    = "eip.tfstate"      # Path/key for this specific state file
    region = "us-east-1"        # AWS region where the S3 bucket is hosted
  }
}



#  This allows other workspaces (like security team) to pull outputs from this state file.
