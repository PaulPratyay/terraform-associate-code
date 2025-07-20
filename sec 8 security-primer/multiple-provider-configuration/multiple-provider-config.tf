# Default AWS provider configuration (used when no alias)
# Region: Asia Pacific (Singapore)

provider "aws" {
  region = "ap-southeast-1"

}

# Named/Aliased provider for AWS Mumbai region (ap-south-1)
# Will be referred using: aws.mumbai

provider "aws" {
  alias  = "mumbai"
  region = "ap-south-1"

}

# Named/Aliased provider for AWS US East region (us-east-1)
# Will be referred using: aws.usa

provider "aws" {
  alias  = "usa"
  region = "us-east-1"

}

# Security Group in US East region
# Uses the aws.usa provider alias

resource "aws_security_group" "sg_1" {
  provider = aws.usa
  name     = "prod-firewall"

}

# Security Group in Mumbai region
# Uses the aws.mumbai provider alias

resource "aws_security_group" "sg_2" {
  provider = aws.mumbai
  name     = "staging-firewall"

}
