# S3 Bucket Definition
resource "aws_s3_bucket" "sample_bucket" {
  bucket = var.bucket_name
  tags = {
    Name = "my_data_bucket_dev"
    ENV  = "Dev"
  }
}

# Ownership Controls
resource "aws_s3_bucket_ownership_controls" "s3_bucket_ownership" {
  bucket = aws_s3_bucket.sample_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Public Access Block Configuration
resource "aws_s3_bucket_public_access_block" "access_block" {
  bucket = aws_s3_bucket.sample_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Bucket ACL
resource "aws_s3_bucket_acl" "bucket_acl" {
  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_ownership,
    aws_s3_bucket_public_access_block.access_block,
  ]

  bucket = aws_s3_bucket.sample_bucket.id
  acl    = "public-read"
}

# Upload Index File
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.sample_bucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

# Upload Error File
resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.sample_bucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}

# Upload All Files from Assets Directory
resource "aws_s3_object" "assets" {
  for_each = fileset("${path.module}/assets", "*")

  bucket = aws_s3_bucket.sample_bucket.id
  key    = "assets/${each.value}"
  source = "${path.module}/assets/${each.value}"
  acl    = "public-read"
}

# Website Configuration
resource "aws_s3_bucket_website_configuration" "event_management" {
  bucket = aws_s3_bucket.sample_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

