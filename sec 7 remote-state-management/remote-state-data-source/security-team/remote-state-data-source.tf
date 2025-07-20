# Pull remote state from the networking team’s S3 backend

data "terraform_remote_state" "eip" {
  backend = "s3"

  config = {
    bucket = "mysunflower-1902" # Same bucket used by networking team
    key    = "eip.tfstate"      # Match the state key (file path)
    region = "us-east-1"        # Same region as backend
  }
}


# This gives the security team access to data.terraform_remote_state.eip.outputs.eip_address.

