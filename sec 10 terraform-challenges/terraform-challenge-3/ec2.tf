# EC2 Instances Created Dynamically Using for_each and a Map

resource "aws_instance" "my_ec2" {

  # Use for_each to iterate over the 'instance_config' map variable
  # Each key in the map will become a separate EC2 instance

  for_each = var.instance_config

  # Assign AMI and instance_type dynamically from each key's value

  ami           = each.value.ami
  instance_type = each.value.instance_type

}

