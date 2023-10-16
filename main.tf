
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

provider "aws" {
  resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "my-s3-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"  # You can set the desired ACL here
}
}