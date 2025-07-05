module "aws_networking" {
  source = "./aws_networking"
  
  VPC_CIDR              = var.VPC_CIDR
  PUBLIC_SUBNET_AZ_1a   = var.PUBLIC_SUBNET_AZ_1a
  PUBLIC_SUBNET_AZ_1b   = var.PUBLIC_SUBNET_AZ_1b
  PRIVATE_SUBNET_AZ_1a  = var.PRIVATE_SUBNET_AZ_1a
  PRIVATE_SUBNET_AZ_1b  = var.PRIVATE_SUBNET_AZ_1b
}

# FIXED: Using module outputs instead of undefined variables
module "aws_rds_database" {
  source = "./aws_rds_database"

  vpc_id = module.aws_networking.vpc_id
  private_subnet_1a_id = module.aws_networking.private_subnet_1a_id
  private_subnet_1b_id = module.aws_networking.private_subnet_1b_id

  RDS_ALLOCATED_STORAGE = var.RDS_ALLOCATED_STORAGE 
  RDS_DB_ENGINE = var.RDS_DB_ENGINE
  RDS_DB_ENGINE_VERSION = var.RDS_DB_ENGINE_VERSION
  RDS_DB_INSTANCE_CLASS = var.RDS_DB_INSTANCE_CLASS
  DB_USERNAME = var.DB_USERNAME
  DB_PASSWORD = var.DB_PASSWORD
}

# FIXED: Using module outputs and proper dependency
module "aws_wordpress" {
  source = "./aws_wordpress"

  AMI_ID = var.AMI_ID
  INSTANCE_TYPE = var.INSTANCE_TYPE
  KEYPAIR_NAME =  var.KEYPAIR_NAME

  vpc_id = module.aws_networking.vpc_id
  public_subnet_1a_id = module.aws_networking.public_subnet_1a_id
  public_subnet_1b_id = module.aws_networking.public_subnet_1b_id
  aws_db_instance_id = module.aws_rds_database.aws_db_instance_id
  
  # ADDED: Ensure RDS is created before WordPress
  depends_on = [module.aws_rds_database]
}
