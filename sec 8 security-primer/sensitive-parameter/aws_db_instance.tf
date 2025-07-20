# Declare a sensitive variable for the database username

variable "user_name_protected" {
  default   = "admin"
  sensitive = true # Marks the variable as sensitive so it won't show in plan or output


}

# Create an AWS RDS MySQL database instance

resource "aws_db_instance" "default" {
  allocated_storage = 10
  db_name           = "mydb"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t3.micro"
  # Use the sensitive variable for the DB username
  username = var.user_name_protected
  # Hardcoded password here — ideally, this should also be passed as a sensitive variable
  password             = "foobarbaz"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
