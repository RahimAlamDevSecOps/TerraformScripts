#Create a new security group
resource "aws_security_group" "my_example_sg" {
  name = "my_security_group"
  description = "Allow SSH and HTTP access"

  #Inbound rule to allow SSH access
  ingress {
from_port = 22
to_port = 22
protocol = "tcp"
cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  #Outbound rule to allow all traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}