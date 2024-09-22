provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "domain" {
  cidr_block = "10.0.0.0/16"

  tags = {
    name = "ews874"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.domain.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "ap-south-1c"
  tags = {
    Name = "public-subnet-01"
  }
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.domain.id
  cidr_block        = "10.0.20.0/22"
  availability_zone = "ap-south-1a"
  tags = {
    Name = "public-subnet-02"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.domain.id

  tags = {
    Name = "internet"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.domain.id
  tags = {
    Name = "public_route_table"
  }
}

resource "aws_route" "internet_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"                   # Route for all IP addresses
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public-route" {
  subnet_id = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}