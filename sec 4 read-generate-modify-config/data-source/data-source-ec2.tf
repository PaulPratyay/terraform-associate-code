# Specify the AWS provider and set the region to "us-east-1"

provider "aws" {
  region = "us-east-1"

}

# Define a data source to fetch information about an existing EC2 instance

data "aws_instance" "example" {
  filter {                  # Apply a filter to search for an instance that has a tag named "Team" with the value "Production"
    name   = "tag:Team"     # Look for the EC2 instance with a tag key called "Team"
    values = ["Production"] # The tag value must be "Production"
  }

}


/*
=> Notes:

    -> This data block will return information about a single matching EC2 instance.
    -> If more than one instance matches the filter, it will throw an error.
*/
