provider "aws" {
  version = "~> 4.0"
  region  = "us-east-1"
}


resource "aws_instance" "dev" {
  count = 3
  ami = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]

}

resource "aws_instance" "dev6" {
  count = 3
  ami = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  
}


resource "aws_instance" "dev4" {

  ami = "ami-06878d265978313ca"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  depends_on = ["aws_s3_bucket.devs3bucket"]  
}



resource "aws_s3_bucket" "devs3bucket" {
  bucket = "bucket-devs3bucket"
  acl    = "private"

  tags = {
    Name = "bucket-devs3bucket"
  }
}
