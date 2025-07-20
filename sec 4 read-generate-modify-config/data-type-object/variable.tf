# variable "my-map" {
#   type = map(number)

# }

variable "my-object" {
  type = object({
    name = string, userId = number
  })

}
