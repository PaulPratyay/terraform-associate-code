# Define a simple AWS Security Group resource

resource "aws_security_group" "my-sg" {
  name = "production-sg" # Name of the security group

}

# This is just a placeholder resource that will now be tracked and managed through the S3 backend.
