locals {
  buckets_settings = {
    bootstrap = {
      desription    = "The bootstrap S3 bucket"
      versioning    = true
      force_destroy = false
      sse_algorithm = "AES256"
    }

    tfstate = {
      desription    = "Main s3 bucket terraform state"
      versioning    = true
      force_destroy = false
      sse_algorithm = "AES256"
    }
  }

  iam_roles = {
    plan = {
      description   = "GitHub Actions Plan role"
      sub_condition = "StringLike"
      sub_value     = "repo:${var.project_settings.org}/${var.project_settings.github_repo}:*"
      s3_actions    = ["s3:GetObject", "s3:ListBucketVersions", "s3:ListBucket", "s3:PutObject", "s3:GetBucketVersioning"]
      s3_buckets    = ["tfstate"]
    }

    apply = {
      description   = "GitHub Actions Apply role"
      sub_condition = "StringEquals"
      sub_value     = "repo:${var.project_settings.org}/${var.project_settings.github_repo}:ref:refs/heads/main"
      s3_actions    = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:ListBucket", "s3:GetBucketVersioning"]
      s3_buckets    = ["tfstate"]
    }

    destroy = {
      description   = "GitHub Actions Destroy role"
      sub_condition = "StringEquals"
      sub_value     = "repo:${var.project_settings.org}/${var.project_settings.github_repo}:ref:refs/heads/main"
      s3_actions    = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject", "s3:ListBucket", "s3:GetBucketVersioning"]
      s3_buckets    = ["tfstate"]
    }
  }
}
