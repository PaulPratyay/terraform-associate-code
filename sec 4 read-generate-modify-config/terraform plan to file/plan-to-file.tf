resource "local_file" "terraform_plan_to_file" {
  content  = "Terraform allows saving a plan to file. We can run the 'terraform apply' by referencing the plan file."
  filename = "new_terraform_plan_to_File.txt"

}
