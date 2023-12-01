resource "aws_route53_record" "default_dns" {
  zone_id = aws_route53_zone.mydomain.zone_id
  name    = var.domain_name
  type    = "A"
  alias {
    name                   = aws_lb.Main_lb.name
    zone_id                = aws_lb.Main_lb.zone_id
    evaluate_target_health = true
  }
}
#data "aws_route53_zone" "mydomain" {
# name = var.domain_name
#}


resource "aws_route53_zone" "mydomain" {
  name = var.domain_name

}
