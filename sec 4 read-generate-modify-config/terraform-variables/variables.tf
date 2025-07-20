# Define the VPN IP address allowed to access resources

variable "vpn_ip" {
  default     = "100.20.30.50/32" # VPN IP with /32 mask (only this IP allowed)
  description = "Public IP address of the VPN server used to restrict access to security group rules"
}

# Define the application port (e.g., 8080)

variable "app_port" {
  default     = "8080" # Application port number
  description = "Port number used by the application (e.g., web app) to allow inbound traffic"

}

#Define the SSG port (default 22)

variable "ssh_port" {
  default     = "22" # SSH port number
  description = "Port number used for SSH access to EC2 instances"

}

#Define the FTP port (default 21)

variable "ftp_port" {
  default     = "21" # FTP port number
  description = "Port number used for FTP access to the EC2 instance or service"

}
