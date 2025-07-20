# variable "password" {
#   sensitive = true
#   default   = "supersecretpassword"

# }

# Create a local file containing sensitive content (e.g., password)

resource "local_sensitive_file" "text_file" {
  content  = "supersecretpassword"
  filename = "password.txt" # The content is treated as sensitive

}

# Output the sensitive content of the file (hidden by default)

output "pass" {
  value     = local_sensitive_file.text_file.content
  sensitive = "true" # Prevents Terraform from printing the output in logs

}


/*

=> Quick Notes on sensitive = true

  -> Prevents exposing sensitive data in:

    -> terraform plan output

    -> terraform apply logs

    -> terraform output unless --sensitive flag is used

    -> Applies to variables, outputs, and some resources like local_sensitive_file.

*/
