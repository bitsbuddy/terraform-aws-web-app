resource "aws_s3_bucket" "new_bucket" {
  bucket = "new_bucket"
  acl    = "private"
}
