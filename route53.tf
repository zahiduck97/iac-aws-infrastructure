
resource "aws_route53_record" "website_record" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.ecs_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.ecs_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Subdominio que apuntará a la IP pública del servicio ECS
resource "aws_route53_record" "ecs_origin" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "ecs-origin.${var.domain_name}"
  type    = "A"
  ttl     = 60
  records = ["0.0.0.0"] # se actualizará automáticamente con la IP real
}
