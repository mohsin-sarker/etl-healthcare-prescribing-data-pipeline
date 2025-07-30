########### IAM Role for NHS Lambda Handler Function ###########

# Create IAM role for lambda nhs raw data handler
resource "aws_iam_role" "nhs_data_handler_role" {
  name = var.lambda_role_name
  assume_role_policy = jsondecode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

############## IAM Policy for S3 Bucket ############
# Create IAM Policy to put and read objects from S3 Bucket
resource "aws_iam_policy" "s3_lambda_policy" {
  name = "s3_bucket_lambda_policy"
  policy = jsondecode({
    version = "2012-10-17",
    Statement = [
        {
        Action = [
            "s3:PutObject",
            "s3:GetObject",
            "s3:ListBucket",
        ],
        Effect   = "Allow"
        Resource = "arn:aws:s3:::${var.s3_bucket_name}/*"
    },
    {
        # more action to add here
    },
    ]
  })
}


############## Attache IAM Policy to Lambda Role ###########
resource "aws_iam_role_policy_attachment" "s3_lambda_policy_attachment" {
  role = aws_iam_role.nhs_data_handler_role
  policy_arn = aws_iam_policy.s3_lambda_policy.arn
}