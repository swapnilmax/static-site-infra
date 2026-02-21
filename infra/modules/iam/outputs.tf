output "iam_user_access_key" {
  description = "Access Key for GitHub Actions"
  value       = aws_iam_access_key.actions_key.id
  sensitive   = true
}

output "iam_user_secret_key" {
  description = "Secret Access Key for GitHub Actions"
  value       = aws_iam_access_key.actions_key.secret
  sensitive   = true
}