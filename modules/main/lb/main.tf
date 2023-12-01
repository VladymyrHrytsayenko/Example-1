resource "aws_lb" "Main_lb" {
  name               = "Main-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.security_groups]
  subnets            = [join(",", var.subnets)]

  tags = {
    Name = "Main-alb"
  }
}

# Create a listener for the ALB
resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.Main_lb.arn
  protocol          = "HTTP"
  port              = 80


  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "listener_https" {
  load_balancer_arn = aws_lb.Main_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.my_certificate.arn


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_app.arn
  }
}


resource "aws_lb_listener_rule" "app2" {
  listener_arn = aws_lb_listener.listener_https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app2.arn
  }

  condition {
    host_header {
      values = [var.domain_name_app2]
    }
  }
}

resource "aws_lb_listener_rule" "app3" {
  listener_arn = aws_lb_listener.listener_https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app3.arn
  }

  condition {
    host_header {
      values = [var.domain_name_app3]
    }
  }
}
