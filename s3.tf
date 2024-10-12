
resource "aws_s3_bucket" "new_bucket" {
  # The name of the bucket.
  bucket = "new-bucket-name"

  # The canned ACL to apply. Defaults to "private".
  acl = "private"

  # Configure your bucket as a static website. It'll be available
  #   at the AWS Region-specific website endpoint of the bucket.
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

resource "aws_s3_bucket_policy" "new_bucket_policy" {
  bucket = aws_s3_bucket.new_bucket.id

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
                "arn:aws:s3:::new-bucket-name/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "new_bucket_object" {
  for_each = fileset("path/to/your/files", "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket.id
  key    = each.value
  source = "path/to/your/files/${each.value}"
  etag   = filemd5("path/to/your/files/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}
