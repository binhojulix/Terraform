resource "aws_security_group" "acesso_ssh" {
  name        = "acesso-sh"
  description = "acesso-sh" 
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdris_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}

resource "aws_security_group" "acesso_ssh-us-east-2" {
  provider = "aws.us-east-2"
  name        = "acesso-sh"
  description = "acesso-sh" 
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.cdris_acesso_remoto
  }
  tags = {
    Name = "ssh"
  }
}