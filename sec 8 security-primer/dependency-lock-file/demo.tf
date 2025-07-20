terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.60"

    }
  }
}

provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "myec2" {
  ami           = "ami-05ffe3c48a9991133"
  instance_type = "t2.micro"

}


/*

=> What is .terraform.lock.hcl?

  -> When you run: terraform init

  -> Terraform creates a .terraform.lock.hcl file, which:

    -> Locks the exact version and checksum of the AWS provider (in your case, 4.60.0)

    -> Ensures repeatable builds — so you or your team always use the same provider version

    -> Is important for collaborative and automated environments

=> If someone else clones your project and runs: terraform init

  -> Terraform will install AWS provider 4.60.0 because it’s already locked, even if newer versions exist.




*/
