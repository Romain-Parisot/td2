output "bucket_name" {
  description = "Name of the S3 bucket"
  value       = aws_s3_bucket.main.id
}

output "bucket_website_endpoint" {
  description = "S3 bucket website endpoint"
  value       = aws_s3_bucket_website_configuration.main.website_endpoint
}

output "cloudfront_distribution_domain_name" {
  description = "CloudFront distribution domain name"
  value       = aws_cloudfront_distribution.s3_distribution.domain_name
}

output "cloudfront_distribution_url" {
  description = "CloudFront distribution URL"
  value       = "https://${aws_cloudfront_distribution.s3_distribution.domain_name}"
}
