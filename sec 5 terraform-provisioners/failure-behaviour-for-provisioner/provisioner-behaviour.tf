# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an IAM User named "provisioner-user"

resource "aws_iam_user" "my_user" {
  name = "provisioner-user"

  # Local-exec Provisioner (Runs after the IAM user is created)

  provisioner "local-exec" {
    command = "echo1 This is creation time provisioner" # This command is intentionally incorrect ("echo1" is not valid)
    # on_failure = continue:
    # Even though the command will fail, Terraform will ignore the error
    # and continue with the rest of the plan/apply

    on_failure = continue

  }

}

/*

=> Summary:

  -> We are simulating a provisioner failure.

  -> We are telling Terraform to continue anyway using on_failure = continue.

  -> This is useful when the script is optional or non-critical.

=> With on_failure = continue:

  -> Terraform ignores the error and proceeds normally.

=> Without on_failure = continue:

  -> Terraform would stop and mark the apply as failed.

*/
