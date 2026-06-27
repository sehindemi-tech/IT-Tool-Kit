terraform {
  backend "s3" {
    bucket       = "it-tool-kit-tfstate-441336784821"
    key          = "dev/terraform.tfstate"
    region       = "eu-west-2"
    use_lockfile = true
  }
}
