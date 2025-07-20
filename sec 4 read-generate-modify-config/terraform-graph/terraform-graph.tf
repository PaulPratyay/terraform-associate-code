# Create an Elastic IP (EIP) for use in the ingress rule

resource "aws_eip" "my_eip" {
  domain = "vpc" # Required when associating with a VPC-based EC2 instance

}

# Create a security group named "attribute-sg"

resource "aws_security_group" "my_sg" {
  name = "attribute-sg"

}

# Create a security group ingress rule that:
# References the Security Group created above
# Uses the public IP of the EIP as a CIDR source

resource "aws_vpc_security_group_ingress_rule" "my_ingress_rule" {
  security_group_id = aws_security_group.my_sg.id

  cidr_ipv4   = "${aws_eip.my_eip.public_ip}/32" # Implicit dependency on EIP
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443

}

# Create an EC2 instance (not connected to other resources in this example)

resource "aws_instance" "my_ec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

}
