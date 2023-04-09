provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_instance" "linux" {
  ami = "ami-0d979355d03fa2522"
  tags = {
    Name = "Linux-PC"
  }
  key_name        = "Terraform-Key"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
  count           = 5
}

resource "aws_security_group" "allow_ssh_http" {
  name = "allow_ssh_http"
  tags = {
    Name = "ALLOW_SSH_HTTP"
  }
  description = "Allowing ssh and http ports"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
