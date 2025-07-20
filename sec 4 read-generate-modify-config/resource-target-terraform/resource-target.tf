# Create an IAM user named "test-demo-user"

resource "aws_iam_user" "my_user" {
  name = "test-demo-user"

}

# Create a security group named "app-firewall"

resource "aws_security_group" "my_sg" {
  name = "app-firewall"

}

# Create a local file with some text content

resource "local_file" "my_text_file" {
  content  = "Resource Targeting in Terraform"    # File content
  filename = "${path.module}/resource-target.txt" # File path and name

}

/*

=> Example Terraform Commands:

    terraform apply -target=aws_iam_user.my_user

  -> This will only create my_user, not the security group or file.

    terraform plan -target=local_file.my_text_file

  ->  Shows the plan for just the local_file resource.

=>  Note:

  -> Resource targeting is great for testing, but it’s not recommended for normal day-to-day use in production.

  -> It can break dependency chains if you're not careful.

*/
