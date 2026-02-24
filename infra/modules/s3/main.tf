resource "aws_s3_bucket" "this" {
    bucket = var.bucket_name
}

resource "aws_s3_bucket_ownership_controls" "ownership" {
    bucket = aws_s3_bucket.this.id

    rule {
        object_ownership = "BucketOwnerEnforced"
    }
}


resource "aws_s3_bucket_public_access_block" "block" {
    bucket = aws_s3_bucket.this.id

    block_public_acls = true
    block_public_policy = true
    ignore_public_acls = true
    restrict_public_buckets = true
}


resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.this.id

    versioning_configuration {
        status = "Enabled"
    }

}

#Bucket policy to allow cloudfront OAC
resource "aws_s3_bucket_policy" "this" {
    bucket = aws_s3_bucket.this.id
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = ["s3:GetObject"]
        Resource = "${aws_s3_bucket.this.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = var.cloudfront_distribution_arn
          }
        }
      }
    ]
  })
}
