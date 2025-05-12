resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.env}-lambda-role"

  assume_role_policy = file("${path.module}/policies/role_assume_policy.json")
}

resource "aws_iam_policy" "ec2_control_policy" {
  name   = "${var.env}-ec2-access-policy"
  policy = file("${path.module}/policies/ec2_access_policy.json")
}

resource "aws_iam_role_policy_attachment" "attach_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = aws_iam_policy.ec2_control_policy.arn
}

resource "aws_lambda_function" "start_instance" {
  filename         = "${path.module}/start_ec2.zip"
  function_name    = "${var.env}-start-ec2"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "start_ec2.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("${path.module}/start_ec2.zip")

  environment {
    variables = {
      INSTANCE_ID = var.ec2_instance_id
    }
  }
}

resource "aws_lambda_function" "stop_instance" {
  filename         = "${path.module}/stop_ec2.zip"
  function_name    = "${var.env}-stop-ec2"
  role             = aws_iam_role.lambda_exec_role.arn
  handler          = "stop_ec2.lambda_handler"
  runtime          = "python3.9"
  source_code_hash = filebase64sha256("${path.module}/stop_ec2.zip")

  environment {
    variables = {
      INSTANCE_ID = var.ec2_instance_id
    }
  }
}
