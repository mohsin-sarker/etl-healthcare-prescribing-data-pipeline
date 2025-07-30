 ######### Resources for Lambda Function ########

# Archive a directory to create a package.
data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir = "${path.module}/../packages"
  output_path = "${path.module}/../packages/lambda_function.zip"
}


#Create Lambda function to handle by fetching "NHS Dispensing Practices dispensing data"
resource "aws_lambda_function" "nhs_raw_data_handler" {
    function_name = var.lambda_function_name
    role = aws_iam_role.nhs_data_handler_role.arn
    filename = data.archive_file.lambda_zip.output_path
    handler = "extract.${var.lambda_function_name}"
    runtime = var.lambda_runtime
    source_code_hash = data.archive_file.lambda_zip.output_base64sha256
    memory_size = var.memory_size
    timeout = var.lambda_timeout

    tags = {
      project = "NHS ETL Dispensing Data Pipeline"
    }
}
