//Public subnets
resource "aws_subnet" "public_subnet_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = var.PUBLIC_SUBNET_AZ_1a
    map_public_ip_on_launch = true // this will give public IP to the EC2 created in this subnet
    tags = {
        Name = "Public subnet 1a tf"
    }

    depends_on = [ aws_vpc.vpc ]
}

resource "aws_subnet" "public_subnet_1b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.PUBLIC_SUBNET_AZ_1b
    map_public_ip_on_launch = true // this will give public IP to the EC2 created in this subnet
    tags = {
      Name = "Public subnet 1b tf"
    }

    depends_on = [ aws_vpc.vpc ]
}

//Private subnets
resource "aws_subnet" "private_subnet_1a" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = var.PRIVATE_SUBNET_AZ_1a
    map_public_ip_on_launch = false // this will be a private subnet used for Database
    tags = {
        Name = "Private subnet 1a tf"
    }

    depends_on = [ aws_vpc.vpc ]
}

resource "aws_subnet" "private_subnet_1b" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.11.0/24"
    availability_zone = var.PRIVATE_SUBNET_AZ_1b
    map_public_ip_on_launch = false // this will be a private subnet used for Database
    tags = {
        Name = "Private subnet 1b tf"
    }

    depends_on = [ aws_vpc.vpc ]
}
