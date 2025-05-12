output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "igw_id" {
  value = aws_internet_gateway.igw.id
}
output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = aws_subnet.public_subnet.id  # Adjust according to your subnet resource name
}

