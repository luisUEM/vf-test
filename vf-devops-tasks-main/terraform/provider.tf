terraform {
  
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.75"
    }
  }

  required_version = ">= 0.15"
}

provider "aws" {
  region                      = "eu-central-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  s3_force_path_style         = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

#TASK - QUESTION 1 

resource "s3_bucket" "vf-bucket" {
  bucket_name = "vf-s3bucket"
  acl    = "private"

  versioning = {
    enabled = true
  }

resource "s3_bucket_acl" "vf-bucket_acl" {
  bucket = s3_bucket.my_protected_bucket.id
  acl    = "private"
}

resource "s3_bucket_versioning" "vf-bucket_versioning" {
  bucket = s3_bucket.vf-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

#TASK - QUESTION 2

#Variable Declaration for 0 to 99 buckets name

variable "bucket_name" {
  type = map(number)
  default  = {"vf-bucket-" = 100 }
  expanded_names = {
    for name, count in var.bucket_name : name => [
      for i in range(count) : format("%s%02d", name, i)
    ]
  }
}


#Resource to create s3 bucket

resource "aws_s3_bucket" "vf_bucket" {
  for_each = toset(var.bucket_list)
  bucket = each.key
}

#Versioning odd S3 buckets id

resource "aws_s3_bucket_versioning" "vf-bucket_versioning" {
  count = var.replicate % 2 != 0
  bucket = aws_s3_bucket.versionig.id
  versioning_configuration {
    status = "Enabled"
  }


