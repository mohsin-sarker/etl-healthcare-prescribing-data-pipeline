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
