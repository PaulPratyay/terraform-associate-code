/* Input Variable Declaration for Instance Configuration
  A map variable where each key is a unique instance name and the value is a nested object with 'instance_type' and 'ami'.
*/

variable "instance_config" {
  type = map(any)
}
