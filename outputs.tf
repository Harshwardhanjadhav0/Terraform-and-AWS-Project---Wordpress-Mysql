# ADDED: Root level outputs for easy access to important information
output "vpc_id" {
  value = module.aws_networking.vpc_id
  description = "ID of the VPC"
}

output "wordpress_public_ip" {
  value = module.aws_wordpress.wordpress_public_ip
  description = "Public IP address of WordPress server"
}

output "wordpress_url" {
  value = "http://${module.aws_wordpress.wordpress_public_ip}"
  description = "WordPress site URL"
}

output "rds_endpoint" {
  value = module.aws_rds_database.rds_endpoint
  description = "RDS MySQL database identifier"
}
