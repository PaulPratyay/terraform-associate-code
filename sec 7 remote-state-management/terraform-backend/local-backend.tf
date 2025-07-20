# Configure Terraform to use the local backend for state storage

terraform {
  backend "local" {

    # This specifies the local path where the Terraform state file will be saved
    # In this case, the file will be saved as 'prod.tfstate' in the current directory

    path = "prod.tfstate"
  }
}

# This overrides the default terraform.tfstate file and explicitly stores the state in prod.tfstate.
