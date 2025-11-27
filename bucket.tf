resource "aws_s3_bucket" "website_bucket" {
  bucket = "tk-my-terraform-static-website-guide-bucket"

  tags = {
    Name = "TK_StaticWebsiteBucket"
  }
}

resource "aws_s3_bucket_website_configuration" "website_configuration" {
  bucket = aws_s3_bucket.website_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_object" "index_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "error_html" {
  bucket = aws_s3_bucket.website_bucket.id
  key    = "error.html"
  source = "error.html"
  content_type = "text/html"
}