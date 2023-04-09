provider "aws" {
  profile    = "Terraform_User"
  access_key = "AKIAYV6RKQOFC2LK4FPK"
  secret_key = "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"
  region     = "ap-northeast-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket-06-05-1997-narasimha-raju"
  tags = {
    Name        = "My-Bucket"
    Environment = "Test"
  }
}

