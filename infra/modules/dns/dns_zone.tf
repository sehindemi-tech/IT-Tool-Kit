resource "aws_route53_zone" "this" {
  name          = var.dns.zone_name
  force_destroy = false

}

resource "aws_route53_record" "this" {
  zone_id = aws_route53_zone.this.id
  name    = aws_route53_zone.this.name
  type    = var.dns_alias.type
  alias {
    name                   = var.dns_alias.alias.alb_dns_name
    zone_id                = var.dns_alias.alias.alb_zone_id
    evaluate_target_health = true
  }
}

