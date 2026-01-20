provider "aws" {
    region = "ca-central-1"
  
}

variable "instances" {
    type = map(string)
    default = {
      "InstanceA" = "t3.micro"
      "InstanceB" = "t3.small"
    }
  
}

resource "aws_instance" "example" {
    for_each = var.instances
    ami = "ami-085f043560da76e08"
    instance_type = each.value
    key_name = "rahimkey"

    tags = {
      name = each.key
    }
}