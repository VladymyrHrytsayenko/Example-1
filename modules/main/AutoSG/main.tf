data "aws_ami" "linux" {
  owners      = var.owners
  most_recent = "true"

  filter {
    name   = "name"
    values = var.values
  }
}


resource "aws_launch_template" "main_server" {
  name                   = "aws_linix"
  instance_type          = var.instance
  image_id               = data.aws_ami.linux.id
  vpc_security_group_ids = [var.SGroup_id]
  key_name               = "LinuxServer"

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 20
    }
  }


  tags = {
    Name = "ClusterServer"
  }
}

resource "aws_autoscaling_group" "ClusterASG" {
  name                      = "ASG-ClusterASG"
  desired_capacity          = var.capacity
  max_size                  = var.max
  min_size                  = var.min
  health_check_type         = "ELB"
  health_check_grace_period = 300
  vpc_zone_identifier       = [join(",", var.vpc_zone_identifier)]

  launch_template {
    id      = aws_launch_template.main_server.id
    version = aws_launch_template.main_server.latest_version
  }

  dynamic "tag" {
    for_each = var.tags

    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    }

  }
  lifecycle {
    create_before_destroy = true
  }
}
