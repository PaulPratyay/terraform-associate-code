# Creating a security group named "dynamic-sg"

resource "aws_security_group" "dynamic_sg" {
  name        = "dynamic-sg"        # Name of the security group
  description = "Ingress for Vault" # Description for documentation

  # Using a dynamic block to create multiple ingress rules

  dynamic "ingress" {
    for_each = var.sg_ports       # Loop over each port in the sg_ports list
    iterator = port               # Define a custom iterator name instead of using the default "ingress"
    content {                     # Defines the actual content of each ingress rule
      from_port   = port.value    # Set the from_port to the current port value
      to_port     = port.value    # Set the to_port to the current port value
      protocol    = "tcp"         # Using TCP protocol
      cidr_blocks = ["0.0.0.0/0"] # Allow access from any IP (not secure for production)
    }

  }

  dynamic "egress" {
    for_each = var.sg_ports
    content {
      from_port   = egress.value
      to_port     = egress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }

}


/*

📝 Points to Remember: 

1. Use dynamic when repeating nested blocks:

    -> Regular blocks (like resource) can use count or for_each.
    -> Nested blocks (like ingress in aws_security_group) need dynamic.

2. for_each is used inside dynamic block to loop through a list or map.

3. ingress.value refers to the current value in the loop — here, each port like 8200, 8201, etc.

4. content {} is required inside dynamic — this defines the actual block to generate.

5. cidr_blocks = ["0.0.0.0/0"] means allow traffic from any IP — good for learning, but not secure for production.

6. A dynamic block doesn't work at top-level resources — it's only for nested ones (like ingress, ebs_block_device, etc.).


=> Iterator

->  iterator is optional — by default, Terraform uses the dynamic block name (e.g., ingress.value).

->  Use iterator when we want a more readable or context-specific variable name inside content.

->  dynamic blocks are only used inside nested resource blocks, not top-level resources.

->  cidr_blocks = ["0.0.0.0/0"] means open to all — good for practice, not safe for real use.

->  We can use map, list, or any iterable object with for_each.

*/

