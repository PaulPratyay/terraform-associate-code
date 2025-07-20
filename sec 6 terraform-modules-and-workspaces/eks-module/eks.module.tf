# Call the Official AWS EKS Module from the Terraform Registry

module "eks" {
  source  = "terraform-aws-modules/eks/aws" # Source location of the module (Terraform public registry)
  version = "20.37.1"                       # Lock the module version to avoid breaking changes in the future
  # Provide a list of subnet IDs where worker nodes (EC2 instances) will be launched
  # These subnets should ideally be in different availability zones for HA
  subnet_ids = ["subnet-02b21d18c4155eb1c", "subnet-015762e2cf45d00aa"]
  # Name of the EKS cluster
  cluster_name = "test"
}



/*
=> What’s Happening:

  -> We are using a pre-built EKS module instead of writing everything from scratch.

=> We specify:

  -> Subnets where EKS will run.
  -> A cluster name (test).
  -> A specific version of the module (20.37.1) to avoid future breaking changes.

=> This module creates:

  -> EKS Control Plane
  -> IAM Roles
  -> Worker Node Groups (optional if you provide more inputs)
  -> Networking and associated resources (if configured)

=>  What You Should Do Next:

  -> This module requires many other inputs if you want to customize node groups, roles, VPC settings, etc.
  -> Minimum inputs to make it work in real setups:
    -> vpc_id
    -> cluster_version
    -> node_groups block
*/
