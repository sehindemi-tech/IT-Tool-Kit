resource "aws_flow_log" "this" {
  iam_role_arn    = aws_iam_role.flow_logs_iam.arn
  log_destination = aws_cloudwatch_log_group.this.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.this.id
}