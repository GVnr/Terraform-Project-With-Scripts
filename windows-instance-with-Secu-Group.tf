provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_instance" "windows" {
  ami = "ami-0b168f9cd578fe5d5"
  tags = {
    Name = "Windows-Pc"
  }
  key_name        = "Terraform-Key"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
}
resource "aws_security_group" "allow_rdp" {
  name        = "allow_rdp"
  description = "allow rdp traffic"
  tags = {
    Name = "ALLOW_RDP"
  }
  ingress {
    from_port   = "3389"
    to_port     = "3389"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


