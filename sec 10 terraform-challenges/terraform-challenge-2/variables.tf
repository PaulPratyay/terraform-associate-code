# Input variable declarations for flexible, reusable infrastructure

variable "https" {} # HTTPS port

variable "apis" {} # API access port from DEV VPC

variable "apis_prod_app" {} # API access port from Prod App Public IP

variable "dev_vpc" {} # CIDR block(s) for DEV VPC

variable "splunk" {} # Splunk egress port (externally configurable)
