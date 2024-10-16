resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.acl

  website {
    index_document = var.index_document
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  versioning {
    enabled = var.versioning_enabled
  }

  force_destroy = var.force_destroy
}

variable "bucket_name" {
  type = string
}

variable "acl" {
  type    = string
  default = "private"
}

variable "index_document" {
  type    = string
  default = "index.html"
}

variable "sse_algorithm" {
  type    = string
  default = "AES256"
}

variable "versioning_enabled" {
  type    = bool
  default = true
}

variable "force_destroy" {
  type    = bool
  default = true
}