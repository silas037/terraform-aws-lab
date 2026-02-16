provider "aws" {
  access_key                  = "test"
  secret_key                  = "test"
  region                      = "us-east-1"
  s3_use_path_style           = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3     = "http://localhost:4566"
    lambda = "http://localhost:4566"
    iam    = "http://localhost:4566"
    sts    = "http://localhost:4566"
  }
}

# 1. THE BUCKET
resource "aws_s3_bucket" "my_automation_bucket" {
  bucket = "freelance-test-bucket-sp07"
}

# 2. THE PERMISSIONS (IAM)
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{ Action = "sts:AssumeRole", Effect = "Allow", Sid = "", Principal = { Service = "lambda.amazonaws.com" } }]
  })
}

# 3. THE LAMBDA FUNCTION
resource "aws_lambda_function" "test_lambda" {
  filename      = "function.zip"
  function_name = "my-freelance-lambda"
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "hello.handler"
  runtime       = "python3.9"
}
