output "alb_sg_id" {
  description = "Id of the web security group"
  value       = aws_security_group.alb_sg.id
}

output "lunch_template_sg" {
  description = "Id of the lunch template security group"
  value       = aws_security_group.lunch_template_sg.id
}

output "db_sg_id" {
  description = "Id of the database security group"
  value       = aws_security_group.db_sg.id
}