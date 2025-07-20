# Define the AWS provider and region

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance

resource "aws_instance" "myec2" {
  ami                    = "ami-09e6f87a47903347c"  # AMI (Amazon Machine Image) to launch the instance
  instance_type          = "t2.micro"               # EC2 instance type
  key_name               = "terraform-key"          # Name of the existing key pair to SSH into the instance
  vpc_security_group_ids = ["sg-0c0f756965c94c459"] # Security group that allows SSH and maybe HTTP access

  # Define how Terraform connects to the instance for provisioning

  connection {
    type        = "ssh"                       # Use SSH to connect
    user        = "ec2-user"                  # Default user for Amazon Linux 2
    private_key = file("./terraform-key.pem") # Path to the private key file for SSH
    host        = self.public_ip              # Use the instance's public IP for the connection
  }

  # Use remote-exec provisioner to run commands on the instance

  provisioner "remote-exec" {
    inline = [                      # List of shell commands to run on the EC2
      "sudo yum -y install nginx",  # Install NGINX web server
      "sudo systemctl start nginx", # Start the NGINX service
    ]
  }

}


/*

📝 Points to Remember

=> remote-exec runs after the resource is created.

=> The connection block must be correct (SSH user, key, public IP).

=> Your security group must allow inbound SSH access (port 22).

=> This method is often used for bootstrapping (e.g., installing packages, starting services).

=> If the connection fails (wrong key, blocked port), the provisioning will fail.

*/
