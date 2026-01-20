provider "aws" {
    region = "ca-central-1" 
}

resource "aws_instance" "testinstance" {
    ami = "ami-085f043560da76e08"
    instance_type = "t3.micro"
    key_name = "rahimkey"
}