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

  statement {
    sid    = "ECRAccess"
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "ecr:PutImage",
      "ecr:InitiateLayerUpload",
      "ecr:UploadLayerPart",
      "ecr:CompleteLayerUpload",
      "ecr:DescribeRepositories",
      "ecr:ListImages",
      "ecr:DescribeImages",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "ECSAccess"
    effect = "Allow"
    actions = [
      "ecs:CreateCluster",
      "ecs:DeleteCluster",
      "ecs:DescribeClusters",
      "ecs:RegisterTaskDefinition",
      "ecs:DeregisterTaskDefinition",
      "ecs:DescribeTaskDefinition",
      "ecs:CreateService",
      "ecs:UpdateService",
      "ecs:DeleteService",
      "ecs:DescribeServices",
      "ecs:ListServices",
      "ecs:ListTaskDefinitions",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "VPCAccess"
    effect = "Allow"
    actions = [
      "ec2:CreateVpc",
      "ec2:DeleteVpc",
      "ec2:DescribeVpcs",
      "ec2:ModifyVpcAttribute",
      "ec2:CreateSubnet",
      "ec2:DeleteSubnet",
      "ec2:DescribeSubnets",
      "ec2:CreateInternetGateway",
      "ec2:DeleteInternetGateway",
      "ec2:AttachInternetGateway",
      "ec2:DetachInternetGateway",
      "ec2:DescribeInternetGateways",
      "ec2:CreateRouteTable",
      "ec2:DeleteRouteTable",
      "ec2:DescribeRouteTables",
      "ec2:CreateRoute",
      "ec2:DeleteRoute",
      "ec2:AssociateRouteTable",
      "ec2:DisassociateRouteTable",
      "ec2:CreateSecurityGroup",
      "ec2:DeleteSecurityGroup",
      "ec2:DescribeSecurityGroups",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeAccountAttributes",
      "ec2:CreateVpcEndpoint",
      "ec2:DeleteVpcEndpoints",
      "ec2:DescribeVpcEndpoints",
      "ec2:ModifyVpcEndpoint",
      "ec2:DescribePrefixLists",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "ALBAccess"
    effect = "Allow"
    actions = [
      "elasticloadbalancing:CreateLoadBalancer",
      "elasticloadbalancing:DeleteLoadBalancer",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticloadbalancing:ModifyLoadBalancerAttributes",
      "elasticloadbalancing:DescribeLoadBalancerAttributes",
      "elasticloadbalancing:CreateListener",
      "elasticloadbalancing:DeleteListener",
      "elasticloadbalancing:DescribeListeners",
      "elasticloadbalancing:ModifyListener",
      "elasticloadbalancing:CreateTargetGroup",
      "elasticloadbalancing:DeleteTargetGroup",
      "elasticloadbalancing:DescribeTargetGroups",
      "elasticloadbalancing:ModifyTargetGroup",
      "elasticloadbalancing:ModifyTargetGroupAttributes",
      "elasticloadbalancing:DescribeTargetGroupAttributes",
      "elasticloadbalancing:RegisterTargets",
      "elasticloadbalancing:DeregisterTargets",
      "elasticloadbalancing:DescribeTargetHealth",
      "elasticloadbalancing:AddTags",
      "elasticloadbalancing:DescribeTags",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "ACMAccess"
    effect = "Allow"
    actions = [
      "acm:RequestCertificate",
      "acm:DeleteCertificate",
      "acm:DescribeCertificate",
      "acm:ListCertificates",
      "acm:AddTagsToCertificate",
      "acm:ListTagsForCertificate",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "R53Access"
    effect = "Allow"
    actions = [
      "route53:CreateHostedZone",
      "route53:DeleteHostedZone",
      "route53:GetHostedZone",
      "route53:ListHostedZones",
      "route53:ChangeResourceRecordSets",
      "route53:GetChange",
      "route53:ListResourceRecordSets",
      "route53:ListTagsForResource",
      "route53:ChangeTagsForResource",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "IAMAccess"
    effect = "Allow"
    actions = [
      "iam:CreateRole",
      "iam:DeleteRole",
      "iam:GetRole",
      "iam:PassRole",
      "iam:AttachRolePolicy",
      "iam:DetachRolePolicy",
      "iam:PutRolePolicy",
      "iam:DeleteRolePolicy",
      "iam:GetRolePolicy",
      "iam:ListRolePolicies",
      "iam:ListAttachedRolePolicies",
      "iam:TagRole",
      "iam:UntagRole",
      "iam:ListInstanceProfilesForRole",
      "iam:CreatePolicy",
      "iam:DeletePolicy",
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:ListPolicyVersions",
      "iam:CreatePolicyVersion",
      "iam:DeletePolicyVersion",
    ]
    resources = ["*"]
  }

  statement {
    sid    = "CloudWatchAccess"
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:DeleteLogGroup",
      "logs:DescribeLogGroups",
      "logs:PutRetentionPolicy",
      "logs:DeleteRetentionPolicy",
      "logs:ListTagsLogGroup",
      "logs:TagLogGroup",
      "logs:UntagLogGroup",
    ]
    resources = ["*"]
  }
}
