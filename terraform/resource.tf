resource "aws_s3_bucket" "devops-bucket" {
  bucket = "devops-second"

  tags = {
    Name        = "DevOps Terraform Bucket"
    Environment = "Development"
  }

  # Add the bucket key configuration
  # bucket_key_enabled = true
}

resource "aws_s3_bucket_server_side_encryption_configuration" "devops-bucket-encryption" {
  bucket = aws_s3_bucket.devops-bucket.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "devops-bucket-versioning" {
  bucket = aws_s3_bucket.devops-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}