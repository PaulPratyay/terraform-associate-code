# Configure the AWS provider to use the us-east-1 region

provider "aws" {
  region = "us-east-1"

}

# Create multiple IAM users using the count meta-argument

resource "aws_iam_user" "my_user" {

  # Dynamically assign each IAM user's name using count.index
  # count.index will take values from 0 to 4 (since count = 5)

  name  = var.iam_names[count.index]
  count = 5          # Create 5 IAM users (same as the length of iam_names list)
  path  = "/system/" # Set a common path for all users (optional, but useful for organizing)

}
