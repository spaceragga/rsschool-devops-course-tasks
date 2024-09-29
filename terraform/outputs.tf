output "s3_bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.devops-bucket.bucket
}

output "s3_bucket_region" {
  description = "The region of the S3 bucket"
  value       = aws_s3_bucket.devops-bucket.region
}

output "terraform_github_actions_role" {
  description = "The ARN of the GitHub Actions IAM role"
  value       = aws_iam_role.github_actions_role.arn
}