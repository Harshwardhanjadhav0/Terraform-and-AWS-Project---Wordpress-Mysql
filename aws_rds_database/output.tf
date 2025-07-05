output "aws_db_instance_id" {
    value = aws_db_instance.mysql_db_rds.id
}

# ADDED: RDS endpoint for WordPress configuration
output "rds_endpoint" {
    value = aws_db_instance.mysql_db_rds.endpoint
    description = "RDS MySQL endpoint for WordPress connection"
}

