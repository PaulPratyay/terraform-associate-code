# Configure the AWS provider and set the region

provider "aws" {
  region = "us-east-1"

}

# Create 3 IAM users using the count meta-argument

resource "aws_iam_user" "my_user" {
  name  = "iamuser.${count.index}" # Dynamic naming: iamuser.0, iamuser.1, iamuser.2
  count = 3                        # Number of IAM users to create
  path  = "/system/"               # Path under which the users will be created (optional organizational info)

}

# Output block to display the ARNs (Amazon Resource Names) of the created IAM users

output "arns" {
  value = aws_iam_user.my_user[*].arn

}





/*

=> Points to Remember:

✅ count is used to create multiple resources with the same configuration.

✅ "iamuser.${count.index}" creates unique names based on the index.

✅ [*] in the output is called a splat expression, and it extracts the arn of each user created.

✅ The output will be a list of ARNs, one for each IAM user.

*/


