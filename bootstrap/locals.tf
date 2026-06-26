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
}

locals {
  iam_roles = {
    plan = {
      description   = "GitHub Actions Plan role"
      sub_condition = "StringLike"
      sub_value     = "repo:${var.project_settings.org}/${var.project_settings.github_repo}:*"
    }

    apply = {
      description   = "GitHub Actions Apply role"
      sub_condition = "StringEqual"
      sub_value     = "repo:${var.project_settings.org}/${var.project_settings.github_repo}:ref:refs/heads/main"
    }

    destroy = {
      description   = "GitHub Actions Destroy role"
      sub_condition = "StringEqual"
      sub_value     = "repo:${var.project_settings.org}/${var.project_settings.github_repo}:ref:refs/heads/main"
    }
  }
}
