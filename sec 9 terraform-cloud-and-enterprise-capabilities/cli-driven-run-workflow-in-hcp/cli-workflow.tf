# Configure Terraform to use Terraform Cloud (HCP)

terraform {
  cloud {

    # Name of the Terraform Cloud organization

    organization = "MySunflower"

    # Specify the Terraform Cloud workspace to use for CLI-driven runs

    workspaces {
      name = "cli-driven-workflow"
    }
  }
}

# Sample Resource: Wait for 10 Seconds on Apply


resource "time_sleep" "wait_10_seconds" {

  # This is a dummy resource used to simulate a delay
  # It will wait for 10 seconds during resource creation

  create_duration = "10s"

}

/*

Explanation:

-> terraform { cloud { ... } }: This tells Terraform to use Terraform Cloud as the backend, pointing to a specific organization and workspace.

-> time_sleep resource: It's a utility resource from the time provider — useful for simulating delays in runs.

*/
