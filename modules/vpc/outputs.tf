// VPC Outputs
output "vpc_arn" {
    value= aws_vpc.vpc.arn
}
output "vpc_id" {
    value= aws_vpc.vpc.id
}
output "vpc_cidr_block" {
    value= aws_vpc.vpc.cidr_block
}
output "vpc_ipv6_cidr_block" {
    value= aws_vpc.vpc.ipv6_cidr_block
}
// internet gateway outputs
output "igw_arn" {
    value= aws_internet_gateway.igw.arn
}
output "igw_id" {
    value= aws_internet_gateway.igw.id
}
output "igw_vpc_id" {
    value= aws_internet_gateway.igw.vpc_id
}
// public subnet outputs
output "public_subnet_vpc" {
    value= aws_subnet.public_subnets.vpc_id
}
output "public_subnet_id" {
    value= aws_subnet.public_subnets.id
}
output "public_subnet_cidr" {
    value= aws_subnet.public_subnets.cidr_block
}
// private subnet outputs
output "private_subnet_vpc" {
    value= aws_subnet.private_subnets.vpc_id
}
output "private_subnet_id" {
    value= aws_subnet.private_subnets.id
}
output "private_subnet_cidr" {
    value= aws_subnet.private_subnets.cidr_block
}
// nat gateway outputs
output "nat_allocation_id" {
    value= aws_nat_gateway.NATgw.allocation_id
}
output "nat_subnet_id" {
    value= aws_nat_gateway.NATgw.subnet_id
}
// route table outputs
output "public_route_table_vpc" {
    value= aws_route_table.route_table_public.vpc_id
}
output "public_route_table_id" {
    value= aws_route_table.route_table_public.id
}
output "private_route_table_vpc" {
    value= aws_route_table.route_table_private.vpc_id
}
output "private_route_table_id" {
    value= aws_route_table.route_table_private.id
}
// route table association
output "public_route_table_association_tableId" {
    value= aws_route_table_association.PublicRTassociation.route_table_id
}
output "private_route_table_association_tableId" {
    value= aws_route_table_association.PrivateRTassociation.route_table_id
}