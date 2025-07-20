# Create an EC2 instance

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = "t2.micro"

  # Implicit Dependency
  # This EC2 instance refers to aws_security_group.prod.id
  # Terraform automatically knows it must create the security group first
  vpc_security_group_ids = [aws_security_group.prod.id]

}

# Create a security group named "production-sg"

resource "aws_security_group" "prod" {
  name = "production-sg"

}
