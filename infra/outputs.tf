output "s3_bucket_name" {
    value = module.s3.bucket_name
}

output "cloudfront_distribution_id" {
    value = modules.cloudfront.id
}