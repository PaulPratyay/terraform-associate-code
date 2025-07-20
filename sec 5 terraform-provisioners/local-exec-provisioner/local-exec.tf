# Configure the AWS provider to use the us-east-1 region

provider "aws" {
  region = "us-east-1"

}

# Create an EC2 instance with a local-exec provisioner

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  # local-exec provisioner: runs after the EC2 instance is created

  provisioner "local-exec" {

    # This command runs on your local machine
    # It appends the private IP of the EC2 instance to a local file

    command = "echo ${self.private_ip} >> server_ip.txt"

    # `${self.private_ip}` accesses the private IP of this EC2 instance
    # `>>` appends the IP to the file 'server_ip.txt' (creates it if not there)

  }

}
