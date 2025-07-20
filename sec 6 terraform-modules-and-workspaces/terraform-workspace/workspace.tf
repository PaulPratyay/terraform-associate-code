# Define instance types for different workspaces using a local map

locals {
  instance_type = {
    default = "t2.nano"  # Used if no specific workspace is selected
    dev     = "t2.micro" # Used when 'dev' workspace is active
    prod    = "m5.large" # Used when 'prod' workspace is active
  }
}

# Launch an EC2 instance with the instance type based on the workspace

resource "aws_instance" "myec2" {
  ami           = "ami-09e6f87a47903347c"
  instance_type = local.instance_type[terraform.workspace] # Dynamically pick instance type based on workspace

}

/*

=> What This Code Does:

  -> We define a map of instance types for different workspaces.
  -> Terraform reads the current workspace name using terraform.workspace.
  -> It uses that name as a key to pick the correct instance type from the map.
  -> So when you switch workspaces (terraform workspace select dev or prod), the EC2 size changes.

terraform workspace list
terraform workspace new dev
terraform workspace select dev
terraform apply     # Will launch t2.micro

terraform workspace select prod
terraform apply     # Will launch m5.large


*/
