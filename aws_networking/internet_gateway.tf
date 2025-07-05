resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "Interway Gateway tf"
    } 

    depends_on = [ aws_vpc.vpc ]
}