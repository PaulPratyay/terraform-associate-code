# Create multiple IAM users using for_each and a set of names
#  This will create IAM users named "Alice", "Bob", "John", and "James".

resource "aws_iam_user" "my_users" {
  for_each = var.user_names # for_each loops over each element in var.user_names (a set of strings)
  name     = each.value     # Use each.value to get the current username from the set

}



# Create multiple EC2 instances using for_each and a map

resource "aws_instance" "myec2" {
  for_each      = var.mymap  # for_each loops over the mymap variable (a map of OS names to AMI IDs)
  ami           = each.value # Launch an EC2 instance using the corresponding AMI, the AMI ID from the map value
  instance_type = "t2.micro" # Same instance type for all

  tags = {
    Name = each.key # Use the key (e.g., "amazon_linux" or "ubuntu") as the Name tag
  }

}

/*

This will create:

One EC2 instance named amazon_linux with its AMI

One EC2 instance named ubuntu with its AMI

*/
