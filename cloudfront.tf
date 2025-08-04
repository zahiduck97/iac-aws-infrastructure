data "aws_acm_certificate" "ssl_cert" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
}

resource "aws_cloudfront_distribution" "ecs_distribution" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name = aws_ecs_service.app_service.network_configuration[0].assign_public_ip
    origin_id   = "ecs-origin"
    custom_origin_config {
      http_port              = 3000
      https_port             = 443
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "ecs-origin"

    forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    acm_certificate_arn = data.aws_acm_certificate.ssl_cert.arn
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}
