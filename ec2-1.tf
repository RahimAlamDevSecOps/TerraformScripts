provider "aws" {
  region = "ca-central-1"
}

resource "aws_instance" "windows" {
  ami           = "ami-04554d8eef35d6f32"
  instance_type = "t3.micro"
  key_name      = "rahimkey"

  vpc_security_group_ids = [aws_security_group.windows_sg.id]

  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "WindowsInstance"
  }
}

resource "aws_security_group" "windows_sg" {
  name        = "windows-sg"
  description = "Allow RDP and HTTP access"

  ingress {
    description = "RDP"
    from_port   = 3389
    to_port     = 3389
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
    Name = "Windows-SG"
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