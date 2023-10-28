locals {
  s3_origin_id = "MyS3Origin"
}


resource "aws_cloudfront_origin_access_control" "default" {
  name  = "OACforMyS3Origin"
  description                       = "OAC for my s3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior  = "always"
  signing_protocol  = "sigv4"
}

resource "aws_s3_bucket" "default" {
  bucket = "mybucket66678"

  tags = {
    Name = "My bucket"
  }
}

resource "aws_s3_bucket_policy" "default" {
  bucket = "mybucket66678"
#   policy = data.aws_iam_policy_document.allow_access_from_another_account.json
policy = jsondecode({
    "Version" = "2012-10-17",
    "Statement" = {
     "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
     "Effect" = "Allow",
     "Principal" = {
     "Service" = "cloudfront.amazonaws.com"
    },
    "Action" = "s3:GetObject",
    "Resource" = "arn:aws:s3:::mybucket66678/*",
    "Condition" = {
    "StringEquals" = {
        "AWS:SourceArn": "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.default}.id"
                }
            }
        },
    })
}


resource "aws_s3_bucket_acl" "b_acl" {
  bucket = "mybucket66678"
  acl    = "private"
}

locals {
  s3_origin_id = "myS3Origin"
}

resource "aws_cloudfront_distribution" "default" {
  origin {
    domain_name              = aws_s3_bucket.mybucket66678.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.default.id
    origin_id                = local.s3_origin_id
  }

  enabled             = true
  is_ipv6_enabled     = true
  comment             = "Some comment"
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = "mylogs.s3.amazonaws.com"
    prefix          = "myprefix"
  }

#   aliases = ["mysite.example.com", "yoursite.example.com"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  tags = {
    Environment = "production"
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}