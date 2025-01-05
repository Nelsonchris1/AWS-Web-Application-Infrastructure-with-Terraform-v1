data "aws_caller_identity" "current" {}

data "aws_elb_service_account" "main" {}

resource "aws_s3_bucket" "alb_logs" {
  bucket = var.bucket_name
  #adding force destory because i want to delete all files when i run terraform destroy
  #not advisable when running live projects 
  force_destroy = true

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_policy" "alb_logs_policy" {
  bucket = aws_s3_bucket.alb_logs.id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
    {
        "Sid": "AWSALBLogsAccess",
        "Effect": "Allow",
        "Principal": {
            "AWS": "${data.aws_elb_service_account.main.arn}"
        },
        "Action": "s3:PutObject",
        "Resource": "${aws_s3_bucket.alb_logs.arn}/*"
    },
    {
        "Sid": "AllowAccountAccess",
        "Effect": "Allow",
        "Principal": {
            "AWS": "${data.aws_caller_identity.current.arn}"
        },
        "Action": ["s3:ListBucket",
                   "s3:GetObject",
                   "s3:GetBucketLocation"],
        "Resource": ["${aws_s3_bucket.alb_logs.arn}/*",
                    "${aws_s3_bucket.alb_logs.arn}"]
    }]
}
POLICY
}