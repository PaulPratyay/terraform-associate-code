# Remote Backend Configuration (S3) for Storing Terraform State

terraform {
  backend "s3" {
    bucket = "my-sunflower-1902" # S3 bucket that will store the remote state file
    key    = "demo.tfstate"      # Path within the bucket to store the state file
    region = "us-east-1"         # Region where the S3 bucket is located


  }
}
