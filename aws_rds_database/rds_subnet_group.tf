resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-subnetgroup"
  subnet_ids = [
    var.private_subnet_1a_id,
    var.private_subnet_1b_id
  ]
  tags = {
    Name = "RDS subnet group"
  }

  depends_on = [ var.private_subnet_1a_id, var.private_subnet_1b_id ]
}