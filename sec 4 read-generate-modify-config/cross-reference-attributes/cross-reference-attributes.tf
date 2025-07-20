# Configure Elastic IP (EIP)

resource "aws_eip" "lb" { # Creates an Elatic IP named "lb"
  domain = "vpc"          # Specifies that this EIP is used inside a Virtual Private Cloud
}


# Configure Security Group

resource "aws_security_group" "example" { # Creates a security group named "example"
  name = "attribute-sg"                   # Security Group name set to "attribute-sg"
}


# Configure ingress/inbound rule

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id # Reference the ID of the SG "example"

  cidr_ipv4   = "${aws_eip.lb.public_ip}/32" # Reference the public IP of the Elastic IP "lb"
  from_port   = 443                          # Allow traffic starting from port 443
  ip_protocol = "tcp"                        # Use TCP Protocol
  to_port     = 443                          # Allow traffic ending at port 443
}


/*

cidr_ipv4   = "${aws_eip.lb.public_ip}/32"

-> CIDR notation (Classless Inter-Domain Routing) defines a range of IPs.

-> /32 says “this exact single IP — no others.”




      CIDR                    Meaning                                                         Number of IPs
      /24         24 bits for network, 8 bits for hosts                                       256 addresses
      /16         16 bits for network, 16 bits for hosts                                      65,636 addresses
      /32         32 bits for network, 0 bits for hosts                                       1 address


-> An IPv4 address is 32 bits long
-> /32 means all 32 bits are for the network, leaving no room for hosts
-> So, only one IP fits in this "network"


=> String Interpolation

-> String interpolation is a way to insert variables or values inside a string.

-> In Terraform (and many programming languages), you use ${...} to insert something inside a string.

-> "aws_eip.lb.public_ip" is the attribute (the public IP of the EIP).

-> The ${...} syntax says:

-> “Take the value of aws_eip.lb.public_ip and insert it here as text.”

-> Then it adds /32 to make a valid CIDR block.


=> No AWS Provider Plugin in this code:

  -> Terraform reads the code and sees:

    🔸 “Hmm, this user is using resources from AWS — like aws_eip and aws_security_group. I need the AWS provider plugin.”

    🔸 Terraform automatically downloads the provider plugin during terraform init.



*/
