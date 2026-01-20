provider "aws" {
  region = "ca-central-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "rahim-linux-rahimdemy-hfkd12345"

  lifecycle {
    #create_before_destroy = true
    #prevent_destroy = true
    ignore_changes = [ tags ]
  }

tags = {
  name ="MyS3Bucket"
  Environment = "Production"
}
}