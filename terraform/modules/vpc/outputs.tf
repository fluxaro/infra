output "vpc_id" {
    description = "ID of the VPC created"
    value       = aws_vpc.main.id
}

output "vpc_cidr_block" {
    description = "CIDR block of the VPC created"
    value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
    description = "IDs of the public subnets created"
    value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
    description = "IDs of the private subnets created"
    value       = aws_subnet.private[*].id
}

output "internet_gateway_id" {
    description = "ID of the Internet Gateway created"
    value       = aws_internet_gateway.main.id
  
}

output "nat_gateway_id" {
    description = "ID of the NAT Gateway created"
    value       = aws_nat_gateway.main.id
}

output "nat_gateway_public_ip" {
    description = "Public IP address of the NAT Gateway"
    value       = aws_eip.nat.public_ip
  
}