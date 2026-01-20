provider "aws" {
    region = "ca-central-1"
}

module "ec2_instance" {
    source = "./EC2-Module"
   instance_type = "t3.small"
}

output "ec2_publice_ip" {
    value  = module.ec2_instance.instance_public_ip
}

output "ec2_private_ip" {
    value  = module.ec2_instance.instance_private_ip
}