# Create the first EC2 instance using a map variable to select instance type based on region

resource "aws_instance" "myec2" {
  ami           = "ami-02457590d33d576c3"     # Amazon Machine Image ID for the EC2 instance
  instance_type = var.using_map["ap-south-1"] # Fetches instance type for ap-south-1 from the using_map variable


}

# Create the second EC2 instance using a list variable to select instance type by index

resource "aws_instance" "ec2" {
  ami           = "ami-02457590d33d576c3" #Same AMI as above
  instance_type = var.using_list[2]       # Fetches the 3rd value ("t2.medium") from the using_list variable

}

