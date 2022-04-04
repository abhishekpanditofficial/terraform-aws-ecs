resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
    tags = {
    project        = var.project
    environment    = var.environment
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.bucket.id
  acl    = var.s3_acl
}
