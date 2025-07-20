# Configure the AWS provider to use the us-east-1 region

provider "aws" {
  region = "us-east-1"

}

# Create an IAM User named "demo-user"

resource "aws_iam_user" "my_user" {
  name = "demo-user"

  # First local-exec provisioner (runs after the user is created)
  # Executes a shell command on your local machine

  provisioner "local-exec" {
    command = "echo local-exec provisioner is starting"

  }

  # Second local-exec provisioner (also runs after user creation)
  # Executes independently after the first one finishes

  provisioner "local-exec" {
    command = "echo local-exec provisioner is starting for second time"

  }

}

/*

=> What’s Happening Step by Step:

  -> Terraform will create an IAM user named demo-user.

=> After creation:

  -> The first local-exec provisioner runs:
    -> prints: local-exec provisioner is starting

  -> Then the second provisioner runs:
    -> prints: local-exec provisioner is starting for second time

  -> Both commands run on your local terminal, not on AWS.

=> This is helpful when you want to:

  -> Run multiple scripts or commands after a resource is created.
  -> Chain steps (like logging, file generation, notifications).
  -> Experiment with execution order and local automation.



*/
