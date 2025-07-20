# Configure the AWS provider with region and credentials

provider "aws" {
  region     = "us-east-2"                  # AWS region where the EC2 instance will be deployed
  access_key = "**************************" # Access key (keep this secure!)
  secret_key = "**************************" # Secret key (keep this secure!)
}

# Create an EC2 instance in AWS

resource "aws_instance" "ec2" {
  ami           = "ami-06c8f2ec674c67112" # AMI ID used to launch the instance
  instance_type = "t2.micro"              # Instance type (free tier eligible)

  tags = {
    Name = "MyEC2" # Name tag assigned to the EC2 instance
  }
}



/*

Main Points about terraform refresh

=> What is terraform refresh?

  -> It updates Terraform's state file to match the real infrastructure.

=> Why use it?

  -> If something in your infrastructure changes outside of Terraform (e.g., EC2 tag updated in AWS console), terraform refresh will detect and sync those changes.

=> How it works:

  -> It does not change infrastructure.

  -> It only updates the .tfstate file with the current real-world values.

=> When should you use it?

  -> After making manual changes in the cloud.

  -> Before running terraform plan to get an accurate comparison.

  -> When you suspect the state file is out of sync.

=> Important notes:

  -> In Terraform 0.15+, terraform plan and terraform apply automatically refresh by default.

  -> To avoid that, you can pass -refresh=false.

*/
