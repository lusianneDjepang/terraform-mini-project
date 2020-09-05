variable az {
  type        = string
  description = "set AZ name"
  default     = "us-east-1a"
}
variable instance_type {
  type        = string
  description = "set aws instance type"
  default     = "t2.micro"
}

variable aws_common_tag {
  type        = map
  description = "set aws tag"
  default = {
    Name = "ec2-eazytraining"
  }
}

variable key_name {
  type        = string
  description = "ssk key to use"
  default     = "devops-lusianne"
}

variable sg {
  type        = string
  description = "set A list of security group names (EC2-Classic) or IDs (default VPC) to associate with"
}
