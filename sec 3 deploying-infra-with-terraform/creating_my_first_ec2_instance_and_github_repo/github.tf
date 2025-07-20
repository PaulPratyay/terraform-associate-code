terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
}


resource "github_repository" "my_first_github_repo" {
  name        = "GitHubRepoWithTerraform"
  description = "Creating repo using terraform for practice"

  visibility = "public"


}




