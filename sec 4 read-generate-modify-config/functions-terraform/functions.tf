# Creating User

resource "aws_iam_user" "my_user" {
  name = "demo-kplabs-user"


}

# Creating demo-user-policy

resource "aws_iam_user_policy" "lb_ro" {
  name = "demo-user-policy"
  user = aws_iam_user.my_user.name

  # Using file() function

  policy = file("./demo-user-policy.json")

}


