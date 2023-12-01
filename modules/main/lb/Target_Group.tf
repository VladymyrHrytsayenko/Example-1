resource "aws_lb_target_group" "main_app" {
  name        = "tg-app1"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id


  health_check {
    healthy_threshold   = "3"
    interval            = "300"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }

  tags = {
    Name = "tg-app1"
  }

}

resource "aws_lb_target_group" "app2" {
  name        = "tg-app2"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = "3"
    interval            = "300"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }

  tags = {
    Name = "tg-app2"
  }

}



resource "aws_lb_target_group" "app3" {
  name        = "tg-app3"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = var.vpc_id

  health_check {
    healthy_threshold   = "3"
    interval            = "300"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = "/"
    unhealthy_threshold = "2"
  }

  tags = {
    Name = "tg-app3"
  }

}
