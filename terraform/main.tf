provider "aws" {
  region = var.region_name
  default_tags {
    tags = {
        ProjectName = var.project_name
        DeployedFrom = "Terraform"
        Repository = "etl-healthcare-prescribing-data-pipeline"
        Environment = "Dev"
    }
  }
}

############## Store Terraform.tstate #############
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "elt-healthcare-prescribing-congif-bucket"
    key = "terraform.tfstate"
    region = "eu-west-2"
  }
}


data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
