terraform {
  backend "s3" {
    bucket = "terra-state-2024"
    key    = "terraform/backend-new"
    region = "us-east-1"
  }
}