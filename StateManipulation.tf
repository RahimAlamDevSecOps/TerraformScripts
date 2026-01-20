provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "example_instance" {
  ami = "ami-085f043560da76e08"
  instance_type = "t3.micro"
  key_name = "rahimkey"

  vpc_security_group_ids = [ aws_security_group.example_sg.id ]


  root_block_device {
    volume_size = 10
  }
  tags = {
    Name = "LinuxInstance"
  }
}

resource "aws_security_group" "example_sg" {
  name        = "example-sg"
  description = "Allow SSH"
  
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ExampleSG"
  }
}