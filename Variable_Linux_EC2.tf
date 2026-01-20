provider "aws" {
    region = "ca-central-1"
  
}

resource "aws_instance" "example_instance" {
    ami = "ami-085f043560da76e08"
    instance_type = "t3.micro"
    key_name = "rahimkey"
  vpc_security_group_ids = [ aws_security_group.example_sg.id ]
  root_block_device {
    volume_size = 8
  }
  tags = {
    Name = "RahimInstance"
  }
}

variable "cidr" {
    description = "CIDR block for security group"
    type = string
  
}

#Create new security group
resource "aws_security_group" "example_sg" {
    name = "example_security_group"
    description = "Allow SSH and HTTP access"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ var.cidr ]
    }
  

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ var.cidr ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ var.cidr ]
  }
}