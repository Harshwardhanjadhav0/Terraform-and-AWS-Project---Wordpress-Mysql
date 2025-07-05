resource "aws_security_group" "RDS_security_group" {
  name = "rds-mysql-sg"
  description = "sg for mysql rds"
  vpc_id = var.vpc_id
  tags = {
    Name = "Sg for Mysql rds"
  }

  depends_on = [ var.vpc_id ]
}

resource "aws_vpc_security_group_egress_rule" "rds_egress_rule" {
  security_group_id = aws_security_group.RDS_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}

# FIXED: Restrict RDS access to VPC CIDR only (more secure)
resource "aws_vpc_security_group_ingress_rule" "rds_ingress_rule1" {
  security_group_id = aws_security_group.RDS_security_group.id
  cidr_ipv4 = "10.0.0.0/16"  # FIXED: Only allow access from VPC, not entire internet
  ip_protocol = "tcp"
  from_port = 3306
  to_port = 3306
}