module "s3" {
    source  = "./modules/s3"
    bucket_name = var.bucket_name
}

module "cloudfront" {
    source = "./modules/cloudfront"
    distro_name = var.cloudfront_name
    bucket_domain = module.s3.bucket_domain
}

module "iam" {
    source = "./modules/iam"
    iam_user = var.iam_user
}

module "dynamodb" {
    source = "./modules/dynamodb"
}