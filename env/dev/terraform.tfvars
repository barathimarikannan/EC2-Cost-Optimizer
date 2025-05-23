env                    = "dev"
vpc_cidr               = "10.0.0.0/16"
ami_id                 = "ami-084568db4383264d4" # Example Amazon Linux 2 AMI
instance_type          = "t2.micro"
public_key_path        = "jenkins_key.pub"
start_cron_expression  = "cron(0 8 * * ? *)"
stop_cron_expression   = "cron(0 20 * * ? *)"
public_subnet_cidr = "10.0.1.0/24"  # Example CIDR block for public subnet
availability_zone  = "us-east-1a" 
allowed_ssh_cidr = "0.0.0.0/0"
