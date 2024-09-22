provider "aws" {
  region = "ap-south-1"
}

module "ec2" {
  source = "./modules/ec2-instamce"
    ami_value = "ami-0522ab6e1ddcc7055"
    instance_type_value = "t2.micro"
    key_name_value = "terra-mum"
}

