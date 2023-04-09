provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_instance" "linux" {
  ami = "ami-0d979355d03fa2522"
  tags = {
    Name = "linux-PC"
  }
  key_name        = "Terraform-Key"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh.name}"]
}

resource "aws_security_group" "allow_ssh" {
  name        = "Allow_ssh"
  description = "allowing ssh port"
  tags = {
    Name = "ALLOW_SSH"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
