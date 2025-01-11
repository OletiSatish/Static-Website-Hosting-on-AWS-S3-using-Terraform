# output for Bucket name
output "bucket_name" {
  value = aws_s3_bucket.sample_bucket.bucket
  description = "The name of the S3 bucket"
}

# output for Website end point
output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.event_management.website_endpoint
  description = "The endpoint for the S3 bucket website"
}
