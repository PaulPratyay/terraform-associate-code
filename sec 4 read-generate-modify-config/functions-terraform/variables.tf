# Variable for AMI IDs mapped to different regions

variable "ami" {
  type = map(any)

}

# Variable to specify which region you want to deploy into

variable "region" {
  type = string

}

# List of environment names used as instance tags (e.g., Dev, Test, Prod)

variable "tags" {
  type = list(string)

}
