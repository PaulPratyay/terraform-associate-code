# Configure the AWS provider to use the us-east-1 region

provider "aws" {
  region = "us-east-1"
}

# Create 3 IAM users using the count meta-argument
# Names will be: iamuser.0, iamuser.1, iamuser.2

resource "aws_iam_user" "my_iam_user" {
  name  = "iamuser.${count.index}" # Dynamic name for each user
  count = 3                        # Create 3 IAM users
  path  = "/system/"               # Set IAM user path

}

# Output the names of all IAM users created
# The splat expression [*] collects all user names into a list

output "iam_names" {
  value = aws_iam_user.my_iam_user[*].name

}

# Output the ARNs of all IAM users created
# The splat expression [*] collects all ARNs into a list

output "arns" {
  value = aws_iam_user.my_iam_user[*].arn

}
