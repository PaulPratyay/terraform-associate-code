resource "aws_instance" "myec2" {
  ami           = "ami-02457590d33d576c3"
  instance_type = var.environment == "" ? "t2.micro" : "m5.large"


}

/* 
=> Try the following options as well

instance_type = var.environment == "development" ? "t2.micro" : "m5.large"

instance_type = var.environment != "development" ? "t2.micro" : "m5.large"

instance_type = var.environment == "" ? "t2.micro" : "m5.large"


*/


resource "aws_instance" "ec2" {
  ami           = "ami-02457590d33d576c3"
  instance_type = var.environment == "production" && var.region == "us-east-1" ? "m5.large" : "t2.micro"


}
