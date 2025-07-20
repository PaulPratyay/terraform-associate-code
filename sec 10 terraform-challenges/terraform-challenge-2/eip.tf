# Elastic IP Resource for the Payment Application

resource "aws_eip" "example" {
  domain = "vpc" # Required when the EIP is associated with a VPC

  # Tags help with resource identification and ownership

  tags = {
    Name = "payment_app"
    Team = "payments_team"
    Env  = "production"
  }
}
