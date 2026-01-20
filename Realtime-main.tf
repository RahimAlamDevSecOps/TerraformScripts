#Define the EC@ instance
resource "aws_instance" "example_instance" {
  ami = "ami-085f043560da76e08"
  instance_type = "t3.micro"
  key_name = "rahimkey"

  #Attach the security group
  vpc_security_group_ids = [ aws_security_group.my_example_sg.id ]

  #Number of instances to launch
  count = 1

  #Root block device (storage)
  root_block_device {
    volume_size = 8
    volume_type = "gp2" # Volume type (General purpose SSD)
  }

  tags = {
    name = "MyInstance"
  }
}
