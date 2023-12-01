output "name" {
  value = aws_lb.Main_lb.id
}

output "DNS_Name" {
  value = aws_lb.Main_lb.dns_name
}
