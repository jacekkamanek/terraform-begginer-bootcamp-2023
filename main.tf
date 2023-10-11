terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.1"
    }
  }
}

provider "aws" {
  # Configuration options
}

resource "random_string" "bucket_suffix" {
  length  = 42
  special = false
  upper   = false
  lower   = true
  number  = true
}

resource "aws_s3_bucket" "example" {
  bucket = "terra-${random_string.bucket_suffix.result}"
  acl    = "private"
}