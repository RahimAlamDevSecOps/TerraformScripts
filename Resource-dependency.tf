provider "aws" {
    region = "ca-central-1"
  
}

resource "aws_security_group" "example" {
    name = "example-sg"
  
}

resource "aws_instance" "example" {
  ami = "ami-085f043560da76e08"
  instance_type = "t3.micro"
  key_name = "rahimkey"
  security_groups = [ aws_security_group.example.name ]
depends_on = [ aws_security_group.example ]
}