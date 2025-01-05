output "bucket_name" {
  description = "Name of the created s3 Bucket"
  value       = aws_s3_bucket.alb_logs.bucket
}