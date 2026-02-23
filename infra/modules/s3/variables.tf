variable "bucket_name" {
    description = "Name of s3 bucket to create"
    type = string
}

variable "cloudfront_distribution_arn" {
    description = "Cloudfront ARN for bucket policy creation"
}