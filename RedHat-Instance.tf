provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_instance" "linux" {
  ami       = "ami-0cd0830ef4d2de449"
  user_data = file("script.sh")
  tags = {
    Name = "RedHat-Linux"
  }
  key_name        = "Terraform-Key"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh_http.name}"]
}

resource "aws_security_group" "allow_ssh_http" {
  name = "allow_ssh"
  tags = {
    Name = "ALLOW_SSH_HTTP"
  }
  description = "allowing ssh HTTP  port"
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
