# Create IAM Role for GitHub Actions
resource "aws_iam_role" "github_actions_role" {
  name = var.github_actions_role_name

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Federated": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
        },
        "Action": "sts:AssumeRoleWithWebIdentity",
        "Condition": {
          "StringEquals": {
            "token.actions.githubusercontent.com:aud": "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub": "repo:${var.repo_name}:*"
          }
        }
      }
    ]
  })
}

data "aws_caller_identity" "current" {}

# Attach Required Policies to the IAM Role
resource "aws_iam_role_policy_attachment" "required_iam_policies" {
  for_each   = toset(var.required_iam_policies)
  role       = aws_iam_role.github_actions_role.name
  policy_arn = each.value
}