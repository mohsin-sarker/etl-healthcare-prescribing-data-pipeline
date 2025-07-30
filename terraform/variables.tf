variable "region_name" {
  type = string
  default = "eu-west-2"
  description = "The name of aws region where the project has been deployed."
}


variable "project_name" {
  type = string
  default = "etl-healthcare-prescribing-data-pipeline"
  description = "This is name of the project"
}


variable "s3_bucket_name" {
  type = string
  default = "elt-healthcare-raw-data"
  description = "Name of the S3 Bucket"
}


variable "lambda_function_name" {
  type = string
  default = "nhs_raw_data_handler"
  description = "Name of the lambda handler"
}


variable "lambda_role_name" {
  type = string
  default = "nhs_raw_data_handler_role"
  description = "Name of the IAM lambda role"
}


variable "lambda_runtime" {
  type = string
  default = "python3.12"
  description = "Runtime for the Lambda funciton"
}


variable "memory_size" {
    type = number
    default = 512
    description = "Memory size for nhs_raw_data_handler function"
}


variable "lambda_timeout" {
  type        = number
  default     = 300
  description = "Maximum execution time for Lambda"
}