# Default AWS Provider - Region: us-east-1
# Used when no alias is specified in a resource/module
provider "aws" {
  region = "us-east-1"

}

# Aliased AWS Provider - Region: ap-south-1 (Mumbai)
# This allows deploying resources to a different AWS region

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"

}

# Calling a custom module named 'network' located in ./module/network

module "sg" {
  source = "./module/network" # Path to the module
  # Pass the aliased provider 'aws.mumbai' to the module under the name 'aws.prod'
  providers = {
    aws.prod = aws.mumbai
  }

}

# This tells the module: "use the Mumbai region for resources that use provider.aws.prod"

/*

=> Summary:

  -> We are enabling our module to deploy to different AWS regions using provider aliases.

  -> We are controlling this behavior from the root module with the providers block.

  -> This is a clean, scalable way to manage multi-region or multi-account AWS infrastructure using modules.

*/
