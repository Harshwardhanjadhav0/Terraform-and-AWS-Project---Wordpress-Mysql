resource "aws_vpc" "vpc" {
  cidr_block = var.VPC_CIDR
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "Terraform VPC"
  }
}
