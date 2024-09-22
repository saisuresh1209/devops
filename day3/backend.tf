terraform {
  backend "s3" {
    bucket = "devsaisuresh"
    region = "ap-south-1"
    # hello there
    key = "chintada/terraform.tfstate"
    
  }
}