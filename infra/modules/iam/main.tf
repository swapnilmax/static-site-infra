resource "aws_iam_user" "actions_user" {
  name = var.iam_user_name
}

resource "aws_iam_access_key" "actions_key" {
  user = aws_iam_user.actions_user.name
}

resource "aws_iam_policy" "actions_policy" {
  name        = "${var.iam_user_name}-policy"
  description = "Least privilege policy for GitHub Actions deployment"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        # Allow S3 sync only for specific bucket
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetObject"
        ]
        Resource = [
          "arn:aws:s3:::${var.bucket_name}",
          "arn:aws:s3:::${var.bucket_name}/*"
        ]
      }

    ]

  }
  )}


resource "aws_iam_user_policy_attachment" "actions_attach" {
  user       = aws_iam_user.actions_user.name
  policy_arn = aws_iam_policy.actions_policy.arn
}