resource "aws_instance" "myec2" {
  ami           = "ami-02457590d33d576c3"
  instance_type = var.instance_type


}
