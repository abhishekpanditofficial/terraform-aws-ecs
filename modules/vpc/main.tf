resource "aws_vpc" "vpc" {
  assign_generated_ipv6_cidr_block= true
  cidr_block = var.aws_vpc_cidr
  instance_tenancy = var.aws_vpc_instance_tenancy
  tags = {
      project = var.project
      environment= var.environment
  }
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}
resource "aws_eip" "nateIP" {
   vpc   = var.elastic_ip_vpc_enabled
 }

resource "aws_nat_gateway" "NATgw" {
   allocation_id = aws_eip.nateIP.id
   subnet_id = aws_subnet.public_subnets.id
 }

resource "aws_subnet" "public_subnets" {
  availability_zone = "us-east-1a"
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.public_subnets
}


resource "aws_subnet" "private_subnets" {
  availability_zone = "us-east-1b"
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.private_subnets
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.aws_route_table_cidr
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    "project" = var.project
  }
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = var.aws_route_table_cidr
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
}

resource "aws_route_table_association" "PublicRTassociation" {
    subnet_id = aws_subnet.public_subnets.id
    route_table_id = aws_route_table.route_table_public.id
 }

resource "aws_route_table_association" "PrivateRTassociation" {
    subnet_id = aws_subnet.private_subnets.id
    route_table_id = aws_route_table.route_table_private.id
 }