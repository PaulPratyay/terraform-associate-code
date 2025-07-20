# Call the ec2 module from modules/ec2
# This will create an EC2 instance using the module logic

module "ec2" {
  source = "../../modules/ec2"

}

# Create an Elastic IP (EIP) and associate it with the EC2 instance
# The instance ID is received from the module's output

resource "aws_eip" "my_eip" {
  instance = module.ec2.instance_id # Use instance_id output from the module
  domain   = "vpc"                  # Required when associating EIP with VPC instance

}

/*

=> Summary:

  -> We created a custom EC2 module that launches an instance and outputs the instance ID.

  -> In teams/A, we called that module, and then created an Elastic IP using the output from the module.

  -> This pattern is super useful for chaining resources across modules.

*/
