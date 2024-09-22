provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "sai_server" {

 ami = var.ami_value
 instance_type = var.instance_type_value
 key_name = var.key_name_value
  
}

resource "aws_s3_bucket" "s3-bucket" {
  
  bucket = var.bucket_value
}

