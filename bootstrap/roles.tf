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
      test     = "StringEquals"
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

resource "aws_iam_role_policy" "role_policies" {
  for_each = local.iam_roles
  role     = aws_iam_role.this[each.key].id
  policy   = data.aws_iam_policy_document.role_policies[each.key].json
}

data "aws_iam_policy_document" "role_policies" {
  for_each = local.iam_roles

  statement {
    sid     = "S3StateAcess"
    effect  = "Allow"
    actions = each.value.s3_actions
    resources = flatten([
      for bucket in each.value.s3_buckets : [
        aws_s3_bucket.this[bucket].arn,
        "${aws_s3_bucket.this[bucket].arn}/*",
      ]
    ])
  }
}
