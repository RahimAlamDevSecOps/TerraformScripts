provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-s3-rahimdemy-bucket-${terraform.workspace}"
}