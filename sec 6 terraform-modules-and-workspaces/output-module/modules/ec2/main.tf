# This file is part of a reusable EC2 module (modules/ec2)
# It creates one EC2 instance and exposes its ID as an output

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

}

# Output the EC2 instance ID so it can be used outside the module

output "instance_id" {

  value = aws_instance.myec2.id

}
