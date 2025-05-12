variable "env" {
  description = "Environment name"
  type        = string
}

variable "start_lambda_arn" {
  description = "ARN of the Lambda function to start EC2"
  type        = string
}

variable "stop_lambda_arn" {
  description = "ARN of the Lambda function to stop EC2"
  type        = string
}

variable "start_cron_expression" {
  description = "Cron expression for EC2 start schedule"
  type        = string
}

variable "stop_cron_expression" {
  description = "Cron expression for EC2 stop schedule"
  type        = string
}
