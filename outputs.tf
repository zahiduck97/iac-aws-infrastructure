output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.public_a.id
}

output "security_group_id" {
  value = aws_security_group.ecs_sg.id
}
