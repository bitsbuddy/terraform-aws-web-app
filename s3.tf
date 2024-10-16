# Define S3 resources.
# https://aws.amazon.com/s3

# https://www.terraform.io/docs/providers/aws/r/s3_bucket.html
resource "aws_s3_bucket" "new_bucket_13" {
  # The name of the bucket.
  bucket = "new-bucket-13-name"

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

resource "aws_s3_bucket_policy" "new_bucket_13_policy" {
  bucket = aws_s3_bucket.new_bucket_13.id

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
                "arn:aws:s3:::new-bucket-13-name/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "new_bucket_13_object" {
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket_13.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

resource "aws_s3_bucket" "new_bucket_14" {
  # The name of the bucket.
  bucket = "new-bucket-14-name"

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

resource "aws_s3_bucket_policy" "new_bucket_14_policy" {
  bucket = aws_s3_bucket.new_bucket_14.id

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
                "arn:aws:s3:::new-bucket-14-name/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "new_bucket_14_object" {
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket_14.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

resource "aws_s3_bucket" "new_bucket_15" {
  # The name of the bucket.
  bucket = "new-bucket-15-name"

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

resource "aws_s3_bucket_policy" "new_bucket_15_policy" {
  bucket = aws_s3_bucket.new_bucket_15.id

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
                "arn:aws:s3:::new-bucket-15-name/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "new_bucket_15_object" {
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket_15.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}

resource "aws_s3_bucket" "new_bucket_16" {
  # The name of the bucket.
  bucket = "new-bucket-16-name"

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

resource "aws_s3_bucket_policy" "new_bucket_16_policy" {
  bucket = aws_s3_bucket.new_bucket_16.id

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
                "arn:aws:s3:::new-bucket-16-name/*"
            ]
        }
    ]
}
POLICY
}

resource "aws_s3_bucket_object" "new_bucket_16_object" {
  for_each = fileset(var.dist_dir, "**")

  acl    = "private"
  bucket = aws_s3_bucket.new_bucket_16.id
  key    = each.value
  source = "${var.dist_dir}/${each.value}"
  etag   = filemd5("${var.dist_dir}/${each.value}")

  content_type = lookup(local.mime_types, split(".", each.value)[length(split(".", each.value)) - 1])
}