module "networking" {
  source   = "../../modules/networking"
  env      = var.env
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr  # Passing variable from terraform.tfvars
  availability_zone  = var.availability_zone  
}

module "security_group" {
  source      = "../../modules/security_group"
  env         = var.env
  vpc_id      = module.networking.vpc_id
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

module "ec2_instance" {
  source            = "../../modules/ec2_instance"
  env               = var.env
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = module.networking.public_subnet_id
  security_group_id = module.security_group.security_group_id
  public_key_path   = var.public_key_path
}

module "lambda" {
  source           = "../../modules/lambda"
  env              = var.env
  ec2_instance_id  = module.ec2_instance.instance_id
}

module "eventbridge" {
  source               = "../../modules/eventbridge"
  env                  = var.env
  start_lambda_arn     = module.lambda.start_lambda_arn
  stop_lambda_arn      = module.lambda.stop_lambda_arn
  start_cron_expression = var.start_cron_expression
  stop_cron_expression  = var.stop_cron_expression
}
