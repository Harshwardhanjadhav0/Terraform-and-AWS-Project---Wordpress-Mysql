variable "AWS_REGION" {}

variable "VPC_CIDR" {}

variable "PUBLIC_SUBNET_AZ_1a" {}
variable "PUBLIC_SUBNET_AZ_1b" {}
variable "PRIVATE_SUBNET_AZ_1a" {}
variable "PRIVATE_SUBNET_AZ_1b" {}

variable "RDS_ALLOCATED_STORAGE" {}
variable "RDS_DB_ENGINE" {}
variable "RDS_DB_ENGINE_VERSION" {}
variable "RDS_DB_INSTANCE_CLASS" {}
variable "DB_USERNAME" {}
variable "DB_PASSWORD" {}

variable "AMI_ID" {}
variable "INSTANCE_TYPE" {}
variable "KEYPAIR_NAME" {}

# REMOVED: These variables are now handled by module outputs
# vpc_id, subnet_ids, and db_instance_id are passed directly from modules
