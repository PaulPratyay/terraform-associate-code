# Call the Official AWS IAM Module from the Terraform Registry

module "iam" {
  source  = "terraform-aws-modules/iam/aws" # Source location of the IAM module on the Terraform public registry
  version = "0.0.4"                         # Lock the module version to ensure consistent and predictable behavior
}


/* Note:

=> This module expects input variables such as:
    -> create_iam_user
    -> name
    -> policy_arn

  -> Since no inputs are currently passed, this will do nothing
  -> or result in an error unless the module defines defaults.

=> What You’re Doing:
  -> You’re calling a pre-built IAM module, which can create users, groups, policies, etc.
  -> But since no inputs are passed, the module won’t perform any action unless it has default values defined inside.
*/
