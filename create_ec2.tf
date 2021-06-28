provider "aws" {
version = "~>3.0"
region = "ap-south-1"
access_key = "****************"
secret_key = "****************"
}

resource "aws_instance" "web" {
ami = "ami-0ad704c126371a549"
instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
type = "map"
default = {
default = "t2.nano"
dev = "t2.micro"
prod = "t2.medium"
}
}
