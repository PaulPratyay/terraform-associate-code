resource "local_file" "demo_text" {
  content  = "Terraform Debugging"
  filename = "${path.module}/demo.txt"

}
