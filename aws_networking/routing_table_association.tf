resource "aws_route_table_association" "subnet_1a" {
  subnet_id = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.route_table.id
  depends_on = [ aws_vpc.vpc, aws_subnet.public_subnet_1a, aws_route_table.route_table ]
}

resource "aws_route_table_association" "subnet_1b" {
  subnet_id = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.route_table.id
  depends_on = [ aws_vpc.vpc, aws_subnet.public_subnet_1b, aws_route_table.route_table ]
}
// Both for public subnet to route table association.

