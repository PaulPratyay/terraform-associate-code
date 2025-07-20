# Define a variable "sg_ports" which will hold a list of port numbers
# These port numbers will later be used to dynamically create ingress rules

variable "sg_ports" {
  type        = list(number)            # Expecting a list of numbers
  description = "List of ingress ports" # Description of what this variable does

}
