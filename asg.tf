resource "aws_autoscaling_group" "asg_home" {
  name                      = "asg-home"
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_size
  availability_zones        = var.availability_zones
  launch_template {
    id      = aws_launch_template.lt_home.id
  }

  target_group_arns = [
    aws_lb_target_group.tg_home.arn,
  ]

  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "env"
    value               = var.env
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "target_tracking_home" {
  name                   = "target-tracking-home"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_home.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50  
  }
}

resource "aws_autoscaling_group" "asg_cloth" {
  name                      = "asg-cloth"
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_size
  availability_zones        = var.availability_zones
  launch_template {
    id      = aws_launch_template.lt_cloth.id
  }

  target_group_arns = [
    aws_lb_target_group.tg_cloth.arn,
  ]

  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "env"
    value               = var.env
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "target_tracking_cloth" {
  name                   = "target-tracking-home"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_cloth.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50  
  }
}

resource "aws_autoscaling_group" "asg_laptop" {
  name                      = "asg-laptop"
  min_size                  = var.min_size
  max_size                  = var.max_size
  desired_capacity          = var.desired_size
  availability_zones        = var.availability_zones
  launch_template {
    id      = aws_launch_template.lt_laptop.id
  }

  target_group_arns = [
    aws_lb_target_group.tg_home.arn,
  ]

  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "env"
    value               = var.env
    propagate_at_launch = true
  }
}
resource "aws_autoscaling_policy" "target_tracking_laptop" {
  name                   = "target-tracking-home"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.asg_laptop.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50  
  }
}
