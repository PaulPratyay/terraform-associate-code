provider "aws" {
  region = "us-east-1"

}

resource "aws_security_group" "old_approach" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "TLS from VPC"
    from_port   = 443                # Port Range
    to_port     = 443                # Port Range
    protocol    = "tcp"              # Protocol
    cidr_blocks = ["10.77.32.50/32"] # Source
  }

  egress {
    from_port   = 0             # Port Range All
    to_port     = 0             # Port Range All
    protocol    = "-1"          # All Protocols
    cidr_blocks = ["0.0.0.0/0"] # Destination
  }

  tags = {
    Name = "allow_tls"
  }

}



