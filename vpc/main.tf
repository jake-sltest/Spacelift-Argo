resource "aws_vpc" "argo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "spacelift-argo VPC"
  }
}

resource "aws_subnet" "argo_subnet_one" {
    vpc_id = aws_vpc.argo_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
        Name = "spacelift-argo Public Subnet one"
    }
}

resource "aws_subnet" "argo_subnet_two" {
    vpc_id = aws_vpc.argo_vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"
    tags = {
        Name = "spacelift-argo Public Subnet two"
    }
}