module "s3" {
    source  = "./modules/s3"
    bucket_name = var.bucket_name
}

module "cloudfront" {
    source = "./modules/cloudfront"
    bucket_domain_name = module.s3.bucket_domain
}

module "iam" {
    source = "./modules/iam"
    bucket_name = module.s3.bucket_name
    distribution_id = module.cloudfront.distribution_id
    iam_user_name = var.iam_user_name
}

