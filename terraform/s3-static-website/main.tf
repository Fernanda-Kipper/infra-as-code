provider "aws" {
  region = "us-east-1"  # substitua pela região desejada
}

variable "bucket_name" {
  type = string
}

resource "aws_s3_bucket" "static_site_bucket" {
  bucket = "static-site-${var.bucket_name}"  # substitua pelo nome desejado

  acl    = "public-read"
  website {
    index_document = "index.html"
    error_document = "error.html"
  }

  tags = {
    Name        = "Static Site Bucket"
    Environment = "Production"
  }
}