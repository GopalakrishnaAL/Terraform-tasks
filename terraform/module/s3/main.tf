# S3 Index bucket.
resource "aws_s3_bucket" "index_bucket" {
  bucket = lower(format("%s", var.name))
}

# Block bucket public access.
resource "aws_s3_bucket_public_access_block" "index_bucket_block_public" {
  bucket = aws_s3_bucket.index_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  depends_on = [aws_s3_bucket.index_bucket]
}

resource "aws_s3_bucket_policy" "vpc_only" {
  bucket = aws_s3_bucket.index_bucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "AllowOnlyFromMyVPC",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:*",
        Resource = [
          aws_s3_bucket.index_bucket.arn,
          "${aws_s3_bucket.index_bucket.arn}/*"
        ],
        Condition = {
          StringEquals = {
            "aws:SourceVpc" = var.vpc_id
          }
        }
      },
    ]
  })
}