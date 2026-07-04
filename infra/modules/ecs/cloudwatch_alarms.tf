resource "aws_cloudwatch_metric_alarm" "this" {
  for_each            = var.cloudwatch_alarms
  alarm_name          = "${each.value.alarm_name}-${each.key}"
  comparison_operator = each.value.comparison_operator
  evaluation_periods  = each.value.evaluation_periods
  metric_name         = each.value.metric_name
  namespace           = each.value.namespace
  period              = each.value.period
  statistic           = each.value.metric_name == "HTTPCode_Target_5XX_Count" ? "Sum" : "Average"
  threshold           = each.value.threshold
  alarm_actions       = [aws_sns_topic.this.arn]
  alarm_description   = each.value.alarm_description
  datapoints_to_alarm = each.value.datapoints_to_alarm
  dimensions          = each.value.dimensions
  ok_actions          = [aws_sns_topic.this.arn]
  treat_missing_data  = each.value.treat_missing_data
}


