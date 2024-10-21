resource "aws_secretsmanager_secret" "ssm" {
  name                    = "${var.application_name}-secrets"
  recovery_window_in_days = 7

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }

  tags = merge(local.tags, var.tags)
}

resource "aws_secretsmanager_secret_version" "ssm_version" {
  secret_id     = aws_secretsmanager_secret.ssm.id
  secret_string = jsonencode(local.secrets)
}

data "aws_iam_policy_document" "ssm" {
  statement {
    sid    = "SecretManagePolicy"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = [
      "secretsmanager:GetSecretValue"
    ]

    resources = [
      aws_secretsmanager_secret.ssm.arn
    ]
  }
}

resource "aws_secretsmanager_secret_policy" "ssm" {
  secret_arn = aws_secretsmanager_secret.ssm.arn
  policy     = data.aws_iam_policy_document.ssm.json
}
