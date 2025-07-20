# Declare an input variable to hold a list of IAM usernames

variable "iam_names" {
  type = list(any) # Accepts a list of any type, ideally strings

}

