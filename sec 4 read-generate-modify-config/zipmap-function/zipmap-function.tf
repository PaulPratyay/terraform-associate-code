// Configure AWS provider to use the us-east-1 region
provider "aws" {
  region = "us-east-1"

}

// Create 3 IAM users using count
resource "aws_iam_user" "my_user" {
  name  = "demo_user.${count.index}" // Usernames will be demo_user.0, demo_user.1, demo_user.2
  count = 3                          // This will create 3 IAM users
  path  = "/system/"                 // Organize the users under the /system/ path

}

// Output the list of ARNs (Amazon Resource Names) for the IAM users

output "arns" {
  value = aws_iam_user.my_user[*].arn

}

// Output the list of IAM usernames created

output "iam_names" {
  value = aws_iam_user.my_user[*].name

}

// Output a map where keys are usernames and values are their corresponding ARNs

output "combined" {
  value = zipmap(aws_iam_user.my_user[*].name, aws_iam_user.my_user[*].arn)


}
