provider "aws" {
  version = "~> 4.0"
  region  = "us-east-1"
}

provider "aws" {
  version = "~> 4.0"
  alias = "us-east-2"
  region  = "us-east-2"
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
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  
}


resource "aws_instance" "dev4" {

  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = { 
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh.id}"]
  depends_on = ["aws_s3_bucket.devs3bucket"]  
}

resource "aws_instance" "dev6u2" {
  provider = "aws.us-east-2"
  ami = var.amis["us-east-2"]
  instance_type = "t2.medium"
  key_name = "terraform_aws"
  tags = { 
    Name = "dev6u2"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso_ssh-us-east-2.id}"]
  depends_on = [
    "aws_dynamodb_table.dynamodb-homolagacao"
  ]
}


resource "aws_dynamodb_table" "dynamodb-homolagacao" {
  provider = "aws.us-east-2"
  name             = "GameScores"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "UserId"
  range_key = "GameTitle"  

  attribute {
    name = "UserId"
    type = "S"
  }

   attribute {
    name = "GameTitle"
    type = "S"
  }


}



resource "aws_s3_bucket" "devs3bucket" {
  bucket = "bucket-devs3bucket"
  acl    = "private"
  tags = {
    Name = "bucket-devs3bucket"
  }
}


