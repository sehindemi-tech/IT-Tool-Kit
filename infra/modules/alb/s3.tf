resource "aws_s3_bucket" "this" {
  bucket        = var.alb_access_logs_bucket.bucket_name
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket                  = aws_s3_bucket.this.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

#trivy:ignore:AVD-AWS-0132
resource "aws_s3_bucket_server_side_encryption_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "this" {
  bucket = aws_s3_bucket.this.bucket

  rule {
    id     = var.alb_access_logs_bucket.rule.id
    status = var.alb_access_logs_bucket.rule.status

    expiration {
      days = var.alb_access_logs_bucket.rule.expiration.days
    }
  }
}