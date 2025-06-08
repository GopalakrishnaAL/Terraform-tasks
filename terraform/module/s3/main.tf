resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "https_only" {
  bucket = aws_s3_bucket.this.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowSSLRequestsOnly",
        Effect    = "Deny",
        Principal = "*",
        Action    = "s3:*",
        Resource  = [
          aws_s3_bucket.this.arn,
          "${aws_s3_bucket.this.arn}/*"
        ],
        Condition = {
          Bool = {
            "aws:SecureTransport" = "vpc-041f164dbfb466c8c"
          }
        }
      }
    ]
  })
}