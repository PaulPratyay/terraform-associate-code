# Specify the AWS provider and the region to use

provider "aws" {
  region = "us-east-1"

}

# Fetch a list of all IAM users in the AWS account

data "aws_iam_users" "users" {}

# Output the names of all IAM users

output "user_names" {
  value = data.aws_iam_users.users.names

}

# Output the total number of IAM users by using the length of the list

output "total_iam_users" {
  value = length(data.aws_iam_users.users.names)

}

# Fetch metadata about the current AWS account (including account ID)

data "aws_caller_identity" "current" {}

# Create an IAM user with the name pattern: admin-user-{AWS account ID}
# The account ID is dynamically fetched using data source above

resource "aws_iam_user" "user_admin" {
  name = "admin-user-${data.aws_caller_identity.current.account_id}"
  path = "/system/" # Optional path for the IAM user

}

output "account_id" {
  value = data.aws_caller_identity.current.account_id

}



