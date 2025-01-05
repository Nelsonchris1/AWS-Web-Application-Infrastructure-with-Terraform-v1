# Security group for ALB
resource "aws_security_group" "alb_sg" {
  name        = "${var.project_name}-ALB-sg"
  description = "Security group for ALB server"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-ALB-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}


resource "aws_vpc_security_group_ingress_rule" "alb_https" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

# Egress Rule for IPv4
resource "aws_vpc_security_group_egress_rule" "all_traffic_ipv4" {
  security_group_id = aws_security_group.alb_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


#EC2 lunch template Security group
resource "aws_security_group" "lunch_template_sg" {
  name        = "${var.project_name}-lunch_template-sg"
  description = "Security group for lunch template for ec2 instances in ASG"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-lunch_template-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "lunch_template_http" {
  security_group_id            = aws_security_group.lunch_template_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = 80
  to_port                      = 80
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "lunch_template_https" {
  security_group_id            = aws_security_group.lunch_template_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = 443
  to_port                      = 443
  ip_protocol                  = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "lunch_template_outbound" {
  security_group_id = aws_security_group.lunch_template_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}



# Database security group

resource "aws_security_group" "db_sg" {
  name        = "${var.project_name}-db-sg"
  description = "Security group for database server"
  vpc_id      = var.vpc_id

  tags = {
    Name = "${var.project_name}-db-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db_access" {
  security_group_id            = aws_security_group.db_sg.id
  referenced_security_group_id = aws_security_group.alb_sg.id
  from_port                    = var.db_port
  ip_protocol                  = "tcp"
  to_port                      = var.db_port
}

resource "aws_vpc_security_group_egress_rule" "db_traffic" {
  security_group_id = aws_security_group.db_sg.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}