# Provider Configuration for Team A

provider "aws" {
  region = "us-east-1"

}

# Call the custom EC2 module defined in modules/ec2

module "ec2" {
  source        = "../../modules/ec2"     # Relative path to the module directory
  ami           = "ami-09e6f87a47903347c" # Input variable: AMI to use
  instance_type = "t2.micro"              # Input variable: instance type
}


/*
=> in simple terms:

  -> I created a template (module) that knows how to launch EC2.

  -> I then used that template in Team A's folder and passed real values.

=> When I run terraform apply from teams/A, it:

  -> Reads the module from modules/ec2

  -> Uses your inputs (AMI & instance type)

  -> Launches an EC2 instance in us-east-1 using those inputs.

=> Why is this useful?

  -> If Team B also wants an EC2 instance, they just call the same module with different values.

 -> You don’t repeat code. You just reuse and plug in different inputs.
*/
