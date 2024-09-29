variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "devops-second"
}

variable "region" {
  description = "The AWS region"
  type        = string
  default     = "eu-west-1"
}

variable "s3_key" {
  description = "The path within the S3 bucket for the Terraform state file"
  type        = string
  default     = "terraform/state/terraform.tfstate"
}

variable "encrypt" {
  description = "Whether to enable encryption for the S3 bucket"
  type        = bool
  default     = true
}

variable "environment" {
  description = "The environment tag for the resources"
  type        = string
  default     = "Development"
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm"
  type        = string
  default     = "AES256"
}

variable "versioning_enabled" {
  description = "Flag to enable versioning"
  type        = bool
  default     = true
}

variable "github_actions_role_name" {
  description = "The name of the IAM role for GitHub Actions"
  type        = string
  default     = "GithubActionsRole"
}

variable "repo_name" {
  description = "The GitHub repository name in the format 'owner/repo'"
  type        = string
  default     = "spaceragga/rsschool-devops-course-tasks"
}

variable "client_id_list" {
  description = "The client ID list for the OIDC provider"
  type        = list(string)
  default     = ["sts.amazonaws.com"]
}

variable "thumbprint_list" {
  description = "The thumbprint list for the OIDC provider"
  type        = list(string)
  default     = ["6938fd4d98bab03faadb97b34396831e3780aea1"]
}

variable "required_iam_policies" {
  description = "Required IAM Policies"
  type        = list(string)
  default = [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
  ]
}