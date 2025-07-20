# Configure EC2 instances

resource "aws_instance" "myec2" {
  ami           = "ami-02457590d33d576c3"
  instance_type = "t2.micro"
  count         = 3 # This will create 3 ec2 instances with identical configuration

  tags = {
    Name = "payment-systems - ${count.index}"
  }

}

# Creating IAM Users

resource "aws_iam_user" "myuser" {
  name  = "payments-user-${count.index}"
  count = 3

}

# Creating IAM Users with Different Names using  variables and count.index

resource "aws_iam_user" "users" {
  name  = var.payment_user_names[count.index]
  count = 3

}













/*

Notes: 

=> Why no error even though all 3 instances are named "myec2"?

    -> The key is in the count meta-argument. Here's how Terraform handles it:

        -> aws_instance.myec2 is the resource name.

        -> When we use count = 3, Terraform creates 3 separate instances internally like this:

            -> aws_instance.myec2[0]

            -> aws_instance.myec2[1]

            -> aws_instance.myec2[2]

    -> So although we wrote just one block with the name myec2, Terraform indexes each instance behind the scenes — just like an array — to keep them separate.

    -> No naming conflict happens because Terraform handles them as separate indexed instances.
*/
