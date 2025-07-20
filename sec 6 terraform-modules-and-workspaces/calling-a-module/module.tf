# Call a remote Terraform module to provision EC2 resources

module "ec2" {

  # The 'source' points to a public GitHub repository.
  # The double slashes (//) are used to specify a subdirectory inside the repo.

  source = "github.com/PaulPratyay/terraform-module//modules/ec2"
}
