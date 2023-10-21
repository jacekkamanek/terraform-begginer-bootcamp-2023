terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

#   resource "aws_vpc" "my_vpc" {
#   cidr_block = "172.16.0.0/16"

#   tags = {
#     Name = "tf-example"
#   }
# }

# resource "aws_subnet" "my_subnet" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "172.16.10.0/24"
#   availability_zone = "eu-central-1a"

#   tags = {
#     Name = "tf-example"
#   }
# }

# resource "aws_network_interface" "foo" {
#   subnet_id   = aws_subnet.my_subnet.id
#   private_ips = ["172.16.10.100"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-websitebucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = "my-s3-websitebucket"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }

  routing_rule {
    condition {
      key_prefix_equals = "docs/"
    }
    redirect {
      replace_key_prefix_with = "documents/"
    }
  }
}