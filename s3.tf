# Define S3 resources.
# https://aws.amazon.com/s3

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "domain" {
  # The name of the bucket.
  bucket = local.bucket_name

  # The canned ACL to apply. Defaults to "private".
  #   https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # Define how Amazon S3 manages objects during their lifetime.
  lifecycle_rule {
    # Object key prefix identifying one or more objects to apply the rule.
    prefix = "/"

    # Enable this lifecycle rule.
    enabled = true

    noncurrent_version_transition {
      # Specify the number of days after object creation
      #   when the specific rule action takes effect.
      days = 30

      # Specifies the Amazon S3 storage class.
      storage_class = "DEEP_ARCHIVE"
    }

    noncurrent_version_expiration {
      days = 365
    }
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "domain_policy" {
  bucket = aws_s3_bucket.domain.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::${local.bucket_name}/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "test2" {
  # The name of the bucket.
  bucket = "test2"

  # The canned ACL to apply. Defaults to "private".
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "test2_policy" {
  bucket = aws_s3_bucket.test2.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::test2/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "test1" {
  # The name of the bucket.
  bucket = "test1"

  # The canned ACL to apply. Defaults to "private".
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "test1_policy" {
  bucket = aws_s3_bucket.test1.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::test1/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "test3" {
  # The name of the bucket.
  bucket = "test3"

  # The canned ACL to apply. Defaults to "private".
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "test3_policy" {
  bucket = aws_s3_bucket.test3.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::test3/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "test4" {
  # The name of the bucket.
  bucket = "test4"

  # The canned ACL to apply. Defaults to "private".
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "test4_policy" {
  bucket = aws_s3_bucket.test4.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::test4/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket" "test_s3_bucket" {
  # The name of the bucket.
  bucket = "test-s3-bucket"

  # The canned ACL to apply. Defaults to "private".
  acl = "public-read"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
  #   http://bucket-name.s3-website-Region.amazonaws.com
  website {
    index_document = "index.html"
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "test_s3_bucket_policy" {
  bucket = aws_s3_bucket.test_s3_bucket.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::test-s3-bucket/*"
            ]
        }
    ]
}
POLICY
}