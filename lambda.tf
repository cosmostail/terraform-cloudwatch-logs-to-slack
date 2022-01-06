resource "aws_lambda_function" "this" {
  filename         = "${path.module}/dist/lambda_function.zip"
  function_name    = var.name
  role             = aws_iam_role.this.arn
  handler          = "lambda.lambda_handler"
  source_code_hash = "${path.module}/dist/lambda_function.zip"
  runtime          = "python3.8"
  timeout          = "900"

  vpc_config {
    security_group_ids = [aws_security_group.this.id]
    subnet_ids         = var.subnets
  }

  environment {
    variables = {
      SLACK_WEBHOOK = var.slack_webhook
    }
  }

  depends_on = [aws_cloudwatch_log_group.this]

  tags = var.tags
}

resource "aws_cloudwatch_log_subscription_filter" "this" {
  name            = "${aws_lambda_function.this.function_name}-filter"
  log_group_name  = var.cw_log_group_name
  filter_pattern  = var.filter_pattern
  destination_arn = aws_lambda_function.this.arn

  depends_on = [
    aws_lambda_permission.this,
    aws_lambda_function.this,
  ]
}

resource "aws_lambda_permission" "this" {
  statement_id  = "${aws_lambda_function.this.function_name}-allow-cloudwatch"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.arn
  principal     = "logs.${var.region}.amazonaws.com"
  source_arn    = "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:log-group:${var.cw_log_group_name}:*"
}

