provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

}

/*

Step 1: Initialize and Apply:

terraform init
terraform apply

-> This will create my EC2 instance.

Step 2: Taint the EC2 Resource:

Taint the EC2 Resource:

terraform taint aws_instance.myec2

-> This marks the myec2 instance as tainted (to be destroyed and recreated

Step 3: Apply Again to Recreate the Instance:

terraform apply

->  Terraform will now destroy the existing EC2 instance and create a new one, even though nothing changed in the code.



*/
