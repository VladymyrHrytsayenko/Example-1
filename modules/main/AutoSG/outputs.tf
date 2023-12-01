output "main_server_templeteid" {
  value = aws_launch_template.main_server.id
}

output "AutoSG_id" {
  value = aws_autoscaling_group.ClusterASG.id
}

output "LT_ServerName" {
  value = aws_launch_template.main_server.name
}

output "AG_arn" {
  value = aws_autoscaling_group.ClusterASG.arn
}
