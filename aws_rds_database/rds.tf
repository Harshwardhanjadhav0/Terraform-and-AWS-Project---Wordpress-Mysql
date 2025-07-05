# FIXED: Using resource reference instead of hard-coded name
resource "aws_db_instance" "mysql_db_rds" {
    allocated_storage = var.RDS_ALLOCATED_STORAGE
    db_name = "mysql_rds"
    engine = var.RDS_DB_ENGINE
    engine_version = var.RDS_DB_ENGINE_VERSION
    instance_class = var.RDS_DB_INSTANCE_CLASS
    username = var.DB_USERNAME
    password = var.DB_PASSWORD
    db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name  # FIXED: Reference to resource
    vpc_security_group_ids = [aws_security_group.RDS_security_group.id]
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot = true
    
    # FIXED: Proper dependencies
    depends_on = [ 
      aws_security_group.RDS_security_group, 
      aws_db_subnet_group.rds_subnet_group 
    ]
}