# Configuring Security Group

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"     # Set the name of the security group
  description = "Managed from Terraform" # Description for the SG

}

# Firewall Rule 1: Allow incoming traffic on the application port (specified by app_port variable)

resource "aws_vpc_security_group_ingress_rule" "app_port" {
  security_group_id = aws_security_group.allow_tls.id # Reference the SG created above
  cidr_ipv4         = var.vpn_ip                      # Allow access only from the VPN IP specified in variables
  from_port         = var.app_port                    #Starting port (e.g., 8080)
  ip_protocol       = "tcp"                           # Protocol type (TCP)
  to_port           = var.app_port                    # Ending port (same as from_port to allpw sepecific port)

}

# Firewall Rule 2: Allow incoming traffic on the SSH port (specified by ssh_port variable)

resource "aws_vpc_security_group_ingress_rule" "ssh_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip # Starting port (22 for SSH)
  from_port         = var.ssh_port
  ip_protocol       = "tcp"
  to_port           = var.ssh_port

}

# Firewall Rule 3: Allow incoming traffic on the FTP port (specified by ftp_port variable)

resource "aws_vpc_security_group_ingress_rule" "ftp_port" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.vpn_ip # Starting port (21 for FTP)
  from_port         = var.ftp_port
  ip_protocol       = "tcp"
  to_port           = var.ftp_port

}
