terraform {
  backend "s3" {
    bucket         = "static-site-state-bucket-007"
    key            = "static-site/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-locks" 
  }
}
