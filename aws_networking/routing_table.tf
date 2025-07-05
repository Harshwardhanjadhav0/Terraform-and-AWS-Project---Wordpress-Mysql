resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"  //This is all internet access to our instance in public subnet
        gateway_id = aws_internet_gateway.igw.id
    }  
    tags = {
      Name = "Route table for internet"
    }
    depends_on = [ aws_vpc.vpc ]
}