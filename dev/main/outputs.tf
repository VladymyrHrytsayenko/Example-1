output "vpc_id" {
  value = aws_vpc.main.id
}


output "vpc_cidr" {
  value = aws_vpc.main.cidr_block

}

output "Public_ids" {
  value = aws_subnet.Public[*].id
}

output "Securitygroup_id" {
  value = aws_security_group.MainSG.id
}
output "aws_db_instance" {
  value = aws_db_instance.default.id
}

output "name" {
  value = aws_lb.Main_lb.id
}

output "DNS_Name" {
  value = aws_lb.Main_lb.dns_name
}

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

output "ecs_cluster_id" {
  value = aws_ecs_cluster.ecs_cluster.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.ecs_cluster.name
}
