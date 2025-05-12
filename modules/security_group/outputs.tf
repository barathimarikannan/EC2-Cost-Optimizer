output "security_group_id" {
  value = aws_security_group.ec2_sg.id
}
output "ec2_sg_id" {
  description = "The ID of the security group"
  value       = aws_security_group.ec2_sg.id  # Adjust according to your security group resource name
}
