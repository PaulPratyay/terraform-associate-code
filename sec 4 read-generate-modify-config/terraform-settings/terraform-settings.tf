terraform {
  required_version = "1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}

resource "aws_security_group" "sg_01" {
  name = "app-firewall"

}
