provider "aws" {
  profile = "default"
  region = "us-east-2"
}

resource "aws_instance" "instance1" {
  ami = "ami-0277b52859bac6f4b"
  instance_type = "t2.micro"
  key_name = "mt5"
  tags = {
      Name = "Chefio server 1",
      App = "Chefio"
  }
}

resource "aws_instance" "instance2" {
  ami = "ami-0277b52859bac6f4b"
  instance_type = "t2.micro"
  key_name = "mt5"
  tags = {
      Name = "Chefio server 2",
      App = "Chefio"
  }
}

resource "aws_eip" "instance1_eip"{
  instance = aws_instance.instance1.id
  vpc      = true
}

resource "aws_eip" "instance2_eip"{
  instance = aws_instance.instance2.id
  vpc      = true
}