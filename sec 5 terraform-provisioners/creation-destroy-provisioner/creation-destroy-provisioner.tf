# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an IAM User named "demo-user"

resource "aws_iam_user" "my_user" {
  name = "demo-user"

  # Creation-time provisioner
  # Runs after the resource is created
  # Here, it simply prints a message to the terminal

  provisioner "local-exec" {
    command = "echo  This is creation time provisioner"

  }

  # Destroy-time provisioner
  # Runs before the resource is destroyed
  # Use 'when = destroy' to specify this behavior

  provisioner "local-exec" {
    command = "echo This is destroy time provisioner"
    when    = destroy

  }

}


/*

Step 1: Configure the AWS provider

  -> Tells Terraform to work with AWS in the us-east-1 region.

Step 2: Create an IAM user

  -> Terraform will create a new IAM user named demo-user.

Step 3: Run a command after creating the user

  -> Using the local-exec provisioner, it runs: echo This is creation time provisioner

  -> This prints a message on your local terminal (not AWS).
  -> Happens after the IAM user is successfully created.

Step 4: Run a command before destroying the user

  -> Another local-exec provisioner runs only at destroy time.
  -> It prints: echo This is destroy time provisioner
  -> Happens right before Terraform deletes the IAM user.

=>  What You’ll See When You Run:

  -> After terraform apply: This is creation time provisioner
  -> After terraform destroy: This is destroy time provisioner

=> Why This is Useful:

  -> Helps us log actions or trigger scripts during resource creation/deletion.

  -> Good for sending alerts, creating backups, cleaning files, etc.

  -> But should be used sparingly — Terraform is meant to be declarative.


*/
