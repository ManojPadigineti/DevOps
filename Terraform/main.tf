terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
# Terraform File Added
resource "aws_instance" "ec2" {
  for_each = var.ec2_name
  instance_type = "each.k"
  vpc_security_group_ids = []
}

variable "ec2_name" {
  type = map(object({
    instance = string
    }))
}

resource "null_resource" "null" {
  
}

