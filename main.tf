terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

provider "aws" {
  # Configuration options

resource "aws_s3_bucket" "example" {
  bucket = "my-tf-tes11t-bucket"

  tags = {
    Name        = "My buck11et"
    Environment = "Dev"
  }
}
}