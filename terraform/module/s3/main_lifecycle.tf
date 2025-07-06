resource "aws_s3_bucket_lifecycle_configuration" "index_bucket_lifecycle" {
  bucket = aws_s3_bucket.index_bucket.id

  rule {
    id     = "expire-after-15-days"
    status = "Enabled"

    expiration {
      days = var.lifecycle_days
    }

    }

  depends_on = [aws_s3_bucket.index_bucket]
}