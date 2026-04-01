resource "aws_lb_listener" "listener_http" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_home.arn
  }
}

resource "aws_lb_listener_rule" "laptop_rule" {
  listener_arn = aws_lb_listener.listener_http.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_laptop.arn
  }

  condition {
    path_pattern {
      values = ["/laptop*"]
    }
  }
}

resource "aws_lb_listener_rule" "cloth_rule" {
  listener_arn = aws_lb_listener.listener_http.arn
  priority     = 2

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg_cloth.arn
  }

  condition {
    path_pattern {
      values = ["/cloth*"]
    }
  }
}