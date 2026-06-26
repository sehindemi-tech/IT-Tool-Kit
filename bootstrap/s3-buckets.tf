resource "aws_s3_bucket" "this" {
  for_each      = local.buckets_settings
  bucket        = "${var.project_settings.project}-${each.key}-${data.aws_caller_identity.current.account_id}"
  force_destroy = each.value.force_destroy

  tags = {
    Name        = "${var.project_settings.project}-${each.key}"
    Description = each.value.desription
    ManagedBy   = "terraform"
    Project     = var.project_settings.project
  }
}

resource "aws_s3_bucket_versioning" "this" {
  for_each = local.buckets_settings
  bucket   = aws_s3_bucket.this[each.key].id

  versioning_configuration {
    status = each.value.versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each                = local.buckets_settings
  bucket                  = aws_s3_bucket.this[each.key].id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
  restrict_public_buckets = true
}

#trivy:ignore:AVD-AWS-0132
resource "aws_s3_bucket_server_side_encryption_configuration" "name" {
  for_each = local.buckets_settings
  bucket   = aws_s3_bucket.this[each.key].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = each.value.sse_algorithm
    }
  }
}
