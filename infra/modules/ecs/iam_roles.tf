resource "aws_iam_role" "this" {
  for_each = var.ecs_iam_roles

  name               = each.value.name
  description        = each.value.description
  assume_role_policy = data.aws_iam_policy_document.ecs_assume_role.json
}

data "aws_iam_policy_document" "ecs_assume_role" {
  statement {
    sid     = "AllowTaskExecution"
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}
resource "aws_iam_role_policy_attachment" "task_execution" {
  for_each = {
    for pair in flatten([
      for role_key, role in var.ecs_iam_roles : [
        for policy_arn in role.policy_arns : {
          key        = "${role_key}-${policy_arn}"
          role_key   = role_key
          policy_arn = policy_arn
        }
      ]
    ]) : pair.key => pair
  }

  role       = aws_iam_role.this[each.value.role_key].name
  policy_arn = each.value.policy_arn
}