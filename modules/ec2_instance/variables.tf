variable "env" {
  description = "Environment name"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID to launch EC2 into"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID to attach to EC2"
  type        = string
}

variable "public_key_path" {
  description = "Path to your local public SSH key (.pub)"
  type        = string
}
