# HOME Target Group
resource "aws_lb_target_group" "tg_home" {
  name     = "tg-home"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
  }

  tags = {
    env = var.env
  }
}


resource "aws_lb_target_group" "tg_laptop" {
  name     = "tg-laptop"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/laptop"
  }

  tags = {
    env = var.env
  }
}


resource "aws_lb_target_group" "tg_cloth" {
  name     = "tg-cloth"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/cloth"
  }

  tags = {
    env = var.env
  }
}