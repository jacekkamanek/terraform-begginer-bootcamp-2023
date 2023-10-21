# terraform {
#   required_providers {
#     aws = {
#       source = "hashicorp/aws"
#       version = "5.21.0"
#     }
#   }
# }

# provider "aws" {
#   # Configuration options
# }

# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "my-s3-websitebucket"
#   acl    = "private"

#   control_object_ownership = true
#   object_ownership         = "ObjectWriter"

#   versioning = {
#     enabled = true
#   }
# }

# resource "aws_s3_bucket_website_configuration" "aws_s3_bucket_website_configuration" {
#   bucket = aws_s3_bucket.my-s3-websitebucket.bucket

#   index_document {
#     suffix = "index.html"
#   }

#   error_document {
#     key = "error.html"
#   }

#   routing_rule {
#     condition {
#       key_prefix_equals = "docs/"
#     }
#     redirect {
#       replace_key_prefix_with = "documents/"
#     }
#   }
# }