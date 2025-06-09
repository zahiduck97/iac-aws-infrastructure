#########################
# CLOUDWATCH
#########################

resource "aws_cloudwatch_log_group" "ecs_app_log_group" {
  name              = "/ecs/${var.project_name}-logs"
  retention_in_days = 7
}

#########################
# S3 BUCKET ALB LOGS
#########################

resource "aws_s3_bucket" "alb_logs_bucket" {
  bucket        = "${var.project_name}-alb-logs"
  force_destroy = true
}

resource "aws_s3_bucket_ownership_controls" "alb_logs_ownership" {
  bucket = aws_s3_bucket.alb_logs_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_policy" "alb_logs_policy" {
  bucket = aws_s3_bucket.alb_logs_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AWSLogDeliveryWrite"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::127311923021:root"
        }
        Action = [
          "s3:PutObject"
        ]
        Resource = "${aws_s3_bucket.alb_logs_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}

