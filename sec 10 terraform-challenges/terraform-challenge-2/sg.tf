# Security Group for the Payment Application (Best Practice Code)

resource "aws_security_group" "payment_app" {

  name        = "payment_app"
  description = "Application Security Group"
  depends_on  = [aws_eip.example] # Ensure Elastic IP is created before referencing it

  # Ingress rule: Allow HTTPS (443) from DEV VPC

  ingress {

    description = "Allows HTTPS  from DEV VPC"
    from_port   = var.https
    to_port     = var.https
    protocol    = "tcp"
    cidr_blocks = var.dev_vpc

  }

  # Ingress rule: Allow API access (e.g., 8080) from DEV VPC

  ingress {

    description = "Allows APIs access from DEV VPC"
    from_port   = var.apis
    to_port     = var.apis
    protocol    = "tcp"
    cidr_blocks = var.dev_vpc

  }

  # Ingress rule: Allow access from Public IP of Production App

  ingress {

    description = "Allows APIs access from Prod App Public IP."
    from_port   = var.apis_prod_app
    to_port     = var.apis_prod_app
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.example.public_ip}/32"]

  }

  # Egress rule: Allow outbound traffic to Splunk (port controlled by variable)

  egress {

    description = "Allows Splunk"
    from_port   = var.splunk
    to_port     = var.splunk
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  # Tags for identification and environment tracking

  tags = {
    Name = "payment_app"
    Team = "payments_team"
    Env  = "production"
  }
}
