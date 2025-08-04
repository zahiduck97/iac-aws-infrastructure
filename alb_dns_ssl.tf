data "aws_route53_zone" "main" {
  name = var.domain_name
}

data "aws_acm_certificate" "ssl_cert" {
  domain   = var.domain_name
  statuses = ["ISSUED"]
}
