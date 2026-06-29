resource "aws_route53_zone" "this" {
  name          = var.dns.zone_name
  force_destroy = false

}

# resource "aws_route53_record" "this" {
#   zone_id = aws_route53_zone.this.id
#   name = var.dns.alias_name
#   type = var.dns.alias_type
#   alias {
#     name =
#     zone_id =
#     evaluate_target_health =
#   }
# }

