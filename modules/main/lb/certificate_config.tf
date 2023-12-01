#data "aws_acm_certificate" "my-certificate" {
# domain   = "example.com"
# statuses = ["ISSUED"]
#}

# Associate the SSL certificate with the ALB listener
resource "aws_lb_listener_certificate" "my-certificate" {
  listener_arn    = aws_lb_listener.listener_https.arn
  certificate_arn = aws_acm_certificate.my_certificate.arn
}





resource "aws_acm_certificate" "my_certificate" {
  domain_name       = "example.com"
  validation_method = "DNS"

  tags = {
    Name = "Domain_certificate"
  }

  lifecycle {
    create_before_destroy = true
  }
}
