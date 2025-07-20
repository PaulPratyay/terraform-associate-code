# __generated__ by Terraform
# Please review these resources and move them into your main configuration files.

# __generated__ by Terraform from "sg-0a6af89e9042eb62c"
resource "aws_security_group" "mysg" {
  description = "Manual" # Set during manual creation from AWS Console

  # Outbound rules (egress)
  # Allow all outbound traffic (typical default)
  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
  }]
  # Inbound rules (ingress)
  # These were defined manually on the console
  # Allow HTTP traffic from anywhere
  ingress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow HTTP from internet"
    from_port        = 80
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 80
    },
    # Allow HTTPS traffic from anywhere
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "Allow HTTPS from internet"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    # Allow SSH only from specific internal IP block
    {
      cidr_blocks      = ["172.31.0.0/32"]
      description      = "Managed by Pratay"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
  }]
  # Meta and identification fields
  name                   = "manually-created-sg"
  name_prefix            = null
  region                 = "us-east-1"
  revoke_rules_on_delete = null
  tags                   = {}
  tags_all               = {}
  vpc_id                 = "vpc-0a8ee33b8a43d29ad" # VPC ID from the AWS Console
}
