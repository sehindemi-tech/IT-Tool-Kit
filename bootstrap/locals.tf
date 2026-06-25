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
