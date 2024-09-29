resource "aws_s3_bucket" "devops-bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "DevOps Terraform Bucket"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "devops-bucket-encryption" {
  bucket = aws_s3_bucket.devops-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_versioning" "devops-bucket-versioning" {
  bucket = aws_s3_bucket.devops-bucket.id

  versioning_configuration {
    status = var.versioning_enabled ? "Enabled" : "Suspended"
  }
}