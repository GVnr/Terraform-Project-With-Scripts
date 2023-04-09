provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_instance" "Linux" {
  ami = "ami-079a2a9ac6ed876fc"
  tags = {
    Name = "Linux-Pc"
  }
  instance_type = "t2.micro"
  key_name      = "Terraform-Key"
}


