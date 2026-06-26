resource "aws_iam_role" "this" {
  for_each = local.iam_roles

  name               = "${var.project_settings.project}-${each.key}"
  assume_role_policy = data.aws_iam_policy_document.this[each.key].json
  description        = each.value.description
}

data "aws_iam_policy_document" "this" {
  for_each = local.iam_roles

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.this.arn]
    }

    condition {
      test     = "StringEqual"
      variable = "token.actions.githubusercontent.com:aud"
      values   = ["sts.amazonaws.com"]
    }

    condition {
      test     = each.value.sub_condition
      variable = "token.actions.githubusercontent.com:sub"
      values   = [each.value.sub_value]
    }
  }
}
