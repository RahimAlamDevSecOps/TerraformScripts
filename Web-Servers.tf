provider "aws" {
  region = "ca-central-1"
}


resource "aws_instance" "windows" {
  ami           = "ami-085f043560da76e08"
  instance_type = "t3.micro"
  key_name      = "rahimkey"

  vpc_security_group_ids = [aws_security_group.windows_sg.id]

  #userdata script
user_data=file("script.sh")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "LinuxInstance"
  }
}

resource "aws_security_group" "windows_sg" {
  name        = "windows-sg"
  description = "Allow SSH and HTTP access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
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
    Name = "WebServer"
  }
}

output "instance_public_ip" {
    description = "The public Ip adress of the EC2 instance"
    value = aws_instance.windows.public_ip
  }
  output "instance_private_ip" {
    description = "The private ip address of the EC2 instance"
    value = aws_instance.windows.private_ip
    
  }