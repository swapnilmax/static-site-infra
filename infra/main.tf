module "s3" {
    source  = "./modules/s3"
    cloudfront_distribution_arn = module.cloudfront.distribution_arn
    bucket_name = var.bucket_name
}

module "cloudfront" {
    source = "./modules/cloudfront"
    oac_name = var.oac_name
    bucket_domain_name = module.s3.bucket_domain
}

module "iam" {
    source = "./modules/iam"
    bucket_name = module.s3.bucket_name
    iam_user_name = var.iam_user_name
}

