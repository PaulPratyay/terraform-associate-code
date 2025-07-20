# Lock the AWS provider to match the networking team

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0" # Match provider version with networking team for compatibility

    }
  }
}
