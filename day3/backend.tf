terraform {
  backend "s3" {
    bucket = "devsaisuresh"
    region = "ap-south-1"
    key = "chintada/terraform.tfstate"
    
  }
}