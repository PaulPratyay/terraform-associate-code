# 🚀 Terraform Associate Code Repository

This repository contains structured code examples, labs, and challenge exercises to help prepare for the **HashiCorp Certified: Terraform Associate (003)** exam. It follows a section-wise breakdown based on a Udemy course and includes hands-on Terraform practices using AWS and other cloud providers.

---

## 📂 Folder Structure

Each folder corresponds to a major topic or module from the course:

- **sec 3 deploying-infra-with-terraform**  
  Basic Terraform CLI usage and deploying infrastructure.

- **sec 4 read-generate-modify-config**  
  Using input variables, built-in functions, data sources.

- **sec 5 terraform-provisioners**  
  Provisioning resources with `local-exec` and `remote-exec`.

- **sec 6 terraform-modules-and-workspaces**  
  Creating custom modules, organizing code, and using workspaces.

- **sec 7 remote-state-management**  
  Remote backends, state locking, and state data referencing.

- **sec 8 security-primer**  
  Handling secrets, sensitive variables, and secure practices.

- **sec 9 terraform-cloud-and-enterprise-capabilities**  
  Working with Terraform Cloud, CLI-driven workflows, and features like Sentinel and HCP.

- **sec 10 terraform-challenges**  
  Real-world practical challenges for exam-level preparation.

---

## ✅ What I Have Learned

- How to use Terraform CLI effectively
- Structure and modularize Terraform code
- Manage and secure state files
- Provision and configure infrastructure resources
- Work with Terraform Cloud and Sentinel policies
- Practice real-world scenarios through challenges

---

## 🚫 Ignored Files

This repo uses a `.gitignore` to keep sensitive or machine-specific files out of version control:

- `.terraform/` (plugin cache)
- `*.tfstate`, `*.tfstate.backup` (state files)
- `*.tfvars` (variable secrets)
- - `*.pem` (private keys)
- `*.key` (private keys)
- `crash.log`

---

## 💡 Useful Terraform Commands

```bash
terraform init          # Initialize a working directory
terraform validate      # Validate configuration syntax
terraform plan          # Show execution plan
terraform apply         # Apply the configuration
terraform destroy       # Tear down managed infrastructure
