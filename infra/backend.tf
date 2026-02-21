terraform {
    backend "s3"{

        bucket = "static-site-state-bucket-007"
        key    = "static-site/terraform.tfstate"
        region = "ap-south-1"
        use_lockfile   = true
        encrypt = true
    }
}
