# Output the public IP of the instance
output "instance_public_ip" {
  description = "The public ip address of the EC2 instance"
  value = aws_instance.example_instance[0].public_ip
}

# Output the private ip of the instance
output "instance_private_ip" {
  description = "The private ip address of the EC2 instance"
  value = aws_instance.example_instance[0].private_ip
}