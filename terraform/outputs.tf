output "s3_bucket_name" {
  value = aws_s3_bucket.devops-bucket.bucket
}

output "s3_bucket_region" {
  value = aws_s3_bucket.devops-bucket.region
}

output "terraform_github_actions_role" {
  value = aws_iam_role.github_actions_role.arn
}