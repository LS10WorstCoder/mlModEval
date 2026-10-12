output "artifacts_bucket_name" {
  description = "Name of the S3 bucket holding uploads and results."
  value       = aws_s3_bucket.artifacts.bucket
}

output "artifacts_bucket_arn" {
  description = "ARN of the artifacts bucket, used in IAM policies."
  value       = aws_s3_bucket.artifacts.arn
}