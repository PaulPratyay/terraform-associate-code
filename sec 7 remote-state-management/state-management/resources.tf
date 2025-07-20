# IAM User Resource - Managed by Terraform

resource "aws_iam_user" "my_user1902" {
  name = "state-management-user-1"

}
/*

# Create a security group

resource "aws_security_group" "my-sg" {
  name = "terraform-firewalls"

}

# Ingress rule: allow HTTP (port 80) access from 10.0.0.0/8

resource "aws_vpc_security_group_ingress_rule" "allow_tls" {
  security_group_id = aws_security_group.my-sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

}

# Ingress rule: allow SSH (port 22) access from 10.0.0.0/8

resource "aws_vpc_security_group_ingress_rule" "allow_tls_1" {
  security_group_id = aws_security_group.my-sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22

}

*/
