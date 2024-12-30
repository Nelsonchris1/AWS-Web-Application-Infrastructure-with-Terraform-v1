resource "aws_launch_template" "web" {
  name_prefix   = "${var.project_name}-lunch_template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name
  user_data = base64encode(<<-EOF
            #!/bin/bash

            # Update System
            apt update -y

            # Install Apache web
            apt install apache2 wget unzip -y

            # download template
            wget https://www.tooplate.com/zip-templates/2089_meteor.zip

            # unzip file
            unzip 2089_meteor.zip

            # Copy file to apache root
            cp 2089_meteor/* -r /var/www/html/

            # start apache2 server
            systemctl start apache2
            systemctl enable apache2
            systemctl status apache2            
        EOF
  )

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_autoscaling_group" "web" {
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1
  target_group_arns   = var.target_group_arn
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "${var.project_name}-asg-instance"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_policy" "cpu_policy" {
  name                   = "${var.project_name}-cpu-tracking-policy"
  autoscaling_group_name = aws_autoscaling_group.web.name
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50
  }
}