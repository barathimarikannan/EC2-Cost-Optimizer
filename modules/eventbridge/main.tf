resource "aws_cloudwatch_event_rule" "start_rule" {
  name                = "${var.env}-start-ec2-rule"
  schedule_expression = var.start_cron_expression
}

resource "aws_cloudwatch_event_target" "start_target" {
  rule      = aws_cloudwatch_event_rule.start_rule.name
  target_id = "startLambda"
  arn       = var.start_lambda_arn
}

resource "aws_lambda_permission" "allow_start" {
  statement_id  = "AllowExecutionFromEventBridgeStart"
  action        = "lambda:InvokeFunction"
  function_name = var.start_lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.start_rule.arn
}

resource "aws_cloudwatch_event_rule" "stop_rule" {
  name                = "${var.env}-stop-ec2-rule"
  schedule_expression = var.stop_cron_expression
}

resource "aws_cloudwatch_event_target" "stop_target" {
  rule      = aws_cloudwatch_event_rule.stop_rule.name
  target_id = "stopLambda"
  arn       = var.stop_lambda_arn
}

resource "aws_lambda_permission" "allow_stop" {
  statement_id  = "AllowExecutionFromEventBridgeStop"
  action        = "lambda:InvokeFunction"
  function_name = var.stop_lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stop_rule.arn
}
