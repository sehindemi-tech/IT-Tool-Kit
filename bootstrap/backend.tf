terraform {
  backend "s3" {
    bucket = "it-tool-kit-bootstrap-441336784821"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
