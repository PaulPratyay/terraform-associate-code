# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"

}

# Create an IAM User

resource "aws_iam_user" "iam-user" {
  name = "Demo-user"

}
