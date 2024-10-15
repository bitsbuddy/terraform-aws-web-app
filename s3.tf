# Define S3 resources.
# https://aws.amazon.com/s3

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "new_bucket" {
  # The name of the bucket.
  bucket = "new-bucket-name"

  # The canned ACL to apply. Defaults to "private".
  acl = "private"

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
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

resource "aws_s3_bucket" "test1_bucket" {
  # The name of the bucket.
  bucket = "test1-bucket"

  # The canned ACL to apply. Defaults to "private".
  acl = "private"

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "test1_bucket_policy" {
  bucket = aws_s3_bucket.test1_bucket.id

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
                "arn:aws:s3:::test1-bucket/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "test1_bucket_object" {
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.test1_bucket.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

resource "aws_s3_bucket" "new_bucket_2" {
  # The name of the bucket.
  bucket = "new-bucket-2-name"

  # The canned ACL to apply. Defaults to "private".
  acl = "private"

  # Enable versioning. Once you version-enable a bucket, it can never
  #   return to an unversioned state. You can, however, suspend versioning
  #   on that bucket.
  versioning {
    enabled = true
  }

  # All objects (including locked) are deleted when deleting a bucket.
  force_destroy = true
}

resource "aws_s3_bucket_policy" "new_bucket_2_policy" {
  bucket = aws_s3_bucket.new_bucket_2.id

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
                "arn:aws:s3:::new-bucket-2-name/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "new_bucket_2_object" {
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket_2.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}