# Configure the Terraform backend to use Amazon S3

terraform {
  backend "s3" {
    bucket       = "my-sunflower-1902"  # Name of the S3 bucket where the Terraform state will be stored
    key          = "production.tfstate" # Key (path inside the bucket) for the state file, we can treat this like a folder/file structure
    region       = "us-east-1"
    use_lockfile = true # Enable a local lock file to prevent accidental overwrites
  }
}

# This ensures the Terraform state is stored remotely, not locally on your machine, making it safe, shareable, and durable.


/*

=> Why Use an S3 Backend?

  -> Centralized State: Everyone on the team uses the same remote state.

  -> Team Collaboration: Avoids overwriting or losing state files.

  -> Enables State Locking (if used with DynamoDB) to prevent concurrent changes.

*/
