# Create a security group named 'production-sg'

resource "aws_security_group" "my-sg" {
  name = "production-sg"

}

# Create an ingress rule allowing HTTPS (port 443) from the Elastic IP of the networking team

resource "aws_vpc_security_group_ingress_rule" "allow-tls" {
  security_group_id = aws_security_group.my-sg.id

  cidr_ipv4   = "${data.terraform_remote_state.eip.outputs.eip_address}/32"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443

}


/*

=> Summary of What You’ve Achieved:

  -> Remote state sharing: terraform_remote_state to pull output from another team’s state
  -> Backend configuration with S3: Proper use of s3 backend for central state storage
  -> Separation of team responsibilities: Networking manages EIP, Security manages SG, connected via state
  -> Provider version pinning: version = "6.0.0" for stability and compatibility

*/
