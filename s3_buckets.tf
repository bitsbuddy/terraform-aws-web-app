module "s3_bucket_s2" {
  source          = "./s3_module"
  bucket_name     = "S2"
  acl             = "public-read"
  index_document  = "index.html"
  sse_algorithm   = "AES256"
  versioning_enabled = true
  force_destroy    = true
}