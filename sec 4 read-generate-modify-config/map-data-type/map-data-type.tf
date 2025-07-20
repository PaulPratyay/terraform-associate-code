# Declare a variable of type map
# This allows you to store key-value pairs under one variable

variable "my-map" {
  type = map(any) # 'map(any)' means keys are strings, and values can be any type
  default = {
    "Name"                   = "Krishna"   # Key = Name, Value = Krishna
    "Team"                   = "Dev"       # Key = Team, Value = Dev
    "Infrastructure as Code" = "Terraform" # Key = Infrastructure as Code, Value = Terraform
  }

}

# Output the value of the variable "my-map"
# This will print the entire map when you run: terraform apply / terraform output

output "variable_value" {
  value = var.my-map

}
