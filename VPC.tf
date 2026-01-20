provider "aws" {
  region = "ca-central-1"
}

#Create a vpc
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "MyTerraformVPC"
  }
}

#Step2: Create Public Subnet
resource "aws_subnet" "PublicSubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
}

#Step3: Create a private subnet
resource "aws_subnet" "PrivateSubnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = "10.0.2.0/24"
  }

  #Step4: Create IGW
  resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.myvpc.id
  }

  #Step5: Route Table for public subnet
resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}