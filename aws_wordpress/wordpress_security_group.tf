resource "aws_security_group" "wordpress_security_group" {
  name = "security group tf"
  description = "Allow inbound HTTP all & inbound all"
  vpc_id = var.vpc_id
  tags = {
    Name = "sg tf"
  }
  depends_on = [ var.vpc_id ]
}

// Adding inbound & outbound rules to sg
resource "aws_vpc_security_group_egress_rule" "wp_egress_rule" {
  security_group_id = aws_security_group.wordpress_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1" // Outbound rule
}

resource "aws_vpc_security_group_ingress_rule" "wp_ingress_rule_1" {
  security_group_id = aws_security_group.wordpress_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 80
  ip_protocol = "tcp"
  to_port = 80 //HTTP traffic
}

resource "aws_vpc_security_group_ingress_rule" "wp_ingress_rule_2" {
  security_group_id = aws_security_group.wordpress_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 22
  ip_protocol = "tcp"
  to_port = 22   // SSH traffic
}

# ADDED: HTTPS support for WordPress
resource "aws_vpc_security_group_ingress_rule" "wp_ingress_rule_3" {
  security_group_id = aws_security_group.wordpress_security_group.id
  cidr_ipv4 = "0.0.0.0/0"
  from_port = 443
  ip_protocol = "tcp"
  to_port = 443   // HTTPS traffic
}
