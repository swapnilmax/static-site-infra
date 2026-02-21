resource "aws_cloudfront_origin_access_control" "this" {
    name = var.oac_name
    description = "OAC for s3 private bucket"
    origin_access_control_origin_type = "s3"
    signing_behavior = "always"
    signing_protocol = "sigv4"
}


resource "aws_cloudfront_distribution" "this" {
    comment = var.comment
    enabled = true
    default_root_object = "index.html"

    origin {
        domain_name = var.bucket_domain_name
        origin_id = "s3-origin"

        origin_access_control_id = aws_cloudfront_origin_access_control.this.id
    }

    default_cache_behavior {
        target_origin_id = "s3-origin"

        viewer_protocol_policy = "redirect-to-https"

        allowed_methods = ["GET", "HEAD"]
        cached_methods  = ["GET", "HEAD"]

        cache_policy_id    = "658327ea-f89d-4fab-a63d-7e88639e58f6"
        response_headers_policy_id = "67f7725c-6f97-4210-82d7-5512b31e9d03"
    }

    restrictions {
        geo_restriction {
            restriction_type = "none"
        }
    }

    viewer_certificate {
        cloudfront_default_certificate = true
    }
}
