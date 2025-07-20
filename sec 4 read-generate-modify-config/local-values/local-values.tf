# Define local values to avoid repetition and make code cleaner

locals {
  default = {
    Team         = "security-teams"                                # Team tag that will be applied to all security groups
    CreationDate = "date-${formatdate("MM-DD-YYYY", timestamp())}" # Dynamically format and store the creation date (e.g., date-08-03-2025)
    # formatdate("MM-DD-YYYY", timestamp()) returns current time in desired format

  }
}

# Security group for application firewall
# Uses tags from the local default map


resource "aws_security_group" "sg_01" {
  name = "app_firewall"
  tags = local.default # Reuse local values defined above for tagging

}

# Security group for database firewall
# Also uses tags from the local default map

resource "aws_security_group" "sg_02" {
  name = "db_firewall"
  tags = local.default # Tags will be the same as in sg_01 (Team + CreationDate)

}
