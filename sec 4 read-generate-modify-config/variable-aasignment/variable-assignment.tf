
resource "aws_instance" "ec2" {
  ami           = "ami-02457590d33d576c3"
  instance_type = var.instance_type

}
