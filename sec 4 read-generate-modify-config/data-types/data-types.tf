# Configure User

resource "aws_iam_user" "lb" {
  name = var.username

}

# Configure EC2 Instance

resource "aws_instance" "myec2" {
  ami                    = "ami-02457590d33d576c3"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-04fbb8379d2275559"]

}
