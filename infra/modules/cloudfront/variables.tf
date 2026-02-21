variable "bucket_domain_name" {
    description = "S3 bucket domain name to be used as CloudFront origin"
    type = string
}

variable "oac_name" {
    description = "Name for Cloudfront Origin Access Control"
    type = string
    default = "s3-oac"
}


variable "comment" {
    description = "Comment for CloudFront distribution"
    type = string
    default = "CDN for static website"
}