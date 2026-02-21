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
    iam_user_name = var.iam_user_name
}

module "dynamodb" {
    source = "./modules/dynamodb"
    dynamodb_table_name = var
}
