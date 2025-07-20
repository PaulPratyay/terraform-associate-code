# Variable for IAM usernames (set of strings, unordered and unique)

variable "user_names" {
  type = set(string)

}

# Variable for EC2 instances (map of names to AMI IDs)

variable "mymap" {
  type = map(any)

}
