# Variable with type list(any) which can contain any type of data

variable "my-list" {
  type = list(any)
}

output "variable-value" {
  value = var.my-list

}

# Configuring security group

resource "aws_security_group" "allow_tls" {
  name        = "terraform-firewall"
  description = "Managed from Terraform"

}

# Configuring EC2 instance

resource "aws_instance" "myec2" {
  ami                    = "ami-02457590d33d576c3"
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-04fbb8379d2275559"]

}

# Variable with type list(number) which can contain only number data type

variable "my_list_number" {
  type = list(number)

}

output "variable_value_list_number" {
  value = var.my_list_number

}
