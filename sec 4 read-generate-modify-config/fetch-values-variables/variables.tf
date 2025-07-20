# Declared a map variable named "using_map"

variable "using_map" {
  type = map(any) # Key-value pairs where key is a region and value is the instance type
}


variable "using_list" {
  type = list(any) # A list of instance types (indexed by numbers starting from 0)


}
