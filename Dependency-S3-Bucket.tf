provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "bucket2" {
  bucket = "rahimdemy-secondary-bucket"
  depends_on = [ aws_s3_bucket.bucket1 ]
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "rahimdemy-primary-bucket"
}