resource "aws_s3_bucket" "raw_data_bucket" {
  bucket = var.s3_bucket_name
}