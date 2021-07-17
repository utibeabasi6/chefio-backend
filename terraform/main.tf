provider "aws" {
  profile = "default"
  region = "us-east-2"
}

# resource "aws_instance" "instance1" {
#   ami = "ami-0277b52859bac6f4b"
#   instance_type = "t2.micro"
#   iam_instance_profile  = "Chefio-server-role"
#   key_name = "mt5"
#   tags = {
#       Name = "Chefio server ",
#       App = "Chefio"
#   }
# }

resource "aws_instance" "db_instance" {
  ami = "ami-0277b52859bac6f4b"
  instance_type = "t2.micro"
  iam_instance_profile  = "Chefio-server-role"
  key_name = "mt5"
  tags = {
      Name = "Chefio Database server ",
      App = "Chefio"
  }
}

resource "aws_eip" "db_instance_eip"{
  instance = aws_instance.db_instance.id
  vpc      = true
}


# resource "aws_eip" "instance1_eip"{
#   instance = aws_instance.instance1.id
#   vpc      = true
# }
