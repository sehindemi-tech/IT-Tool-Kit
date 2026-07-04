#trivy:ignore:AWS-0095
resource "aws_sns_topic" "this" {
  name = var.sns_topic_name
}

resource "aws_sns_topic_policy" "this" {
  arn    = aws_sns_topic.this.arn
  policy = data.aws_iam_policy_document.sns.json
}


resource "aws_sns_topic_subscription" "this" {
  endpoint  = var.sns_topic_subscription_email
  protocol  = "email"
  topic_arn = aws_sns_topic.this.id
}
data "aws_iam_policy_document" "sns" {
  statement {
    sid    = "AllowCloudWatchPublish"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudwatch.amazonaws.com"]
    }

    actions   = ["sns:Publish"]
    resources = [aws_sns_topic.this.arn]

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = [for alarm in aws_cloudwatch_metric_alarm.this : alarm.arn]
    }
  }
}