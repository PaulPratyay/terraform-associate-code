// List - Data Type



variable "my-list" {
  type = list(any)


}

output "mylist" {
  value = var.my-list

}



// Set

/*

variable "my-set" {
  type = set(string)

}

output "myset" {
  value = var.my-set

}

*/
