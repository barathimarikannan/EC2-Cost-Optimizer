variable "env" {}
variable "vpc_cidr" {}
variable "ami_id" {}
variable "instance_type" {}
variable "public_key_path" {}
variable "start_cron_expression" {}
variable "stop_cron_expression" {}
# In variables.tf (root module)

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "availability_zone" {
  description = "Availability Zone for the subnet"
  type        = string
}
variable "allowed_ssh_cidr" {
  description = "CIDR block allowed to SSH into EC2"
  type        = string
}