provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_instance" "windows" {
  ami = "ami-0b168f9cd578fe5d5"
  tags = {
    Name = "Windows-PC"
  }
  instance_type = "t2.micro"
  key_name      = "Terraform-Key"
}
