resource "aws_vpc" "argo_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "spacelift-argo VPC"
  }
}

resource "aws_subnet" "argo_subnet" {
    vpc_id = aws_vpc.argo_vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"

    tags = {
        Name = "spacelift-argo Public Subnet"
    }
}