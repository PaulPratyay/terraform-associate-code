# AWS Provider Configuration

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance with lifecycle rule to ignore changes

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  tags = {
    Name = "Elastic Compute Cloud" # Custom tag for the EC2 instance
  }

  # Lifecycle block to control how Terraform reacts to changes

  lifecycle {
    # ignore_changes = all means:
    # Terraform will ignore *all future changes* to this resource
    # It won't try to update or recreate the resource if changes are made
    ignore_changes = all
  }



}


/*

-> Use ignore_changes = all carefully — Terraform will no longer enforce your config.

-> You can also use:

  -> ignore_changes = [tags, instance_type]

*/
