output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.public_subnets[*].id
}

output "ec2_public_ips" {
  value = aws_instance.web[*].public_ip
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}
