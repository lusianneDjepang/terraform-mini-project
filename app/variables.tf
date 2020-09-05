variable "aws_common_tag" {
  type        = map
  description = "Key Value pair map of attributes required for creating EC2 instance"
  default = {
    Name = "ec2-app-lusianne"
  }
}

variable "az" {
  type        = string
  description = "default AZ"
  default     = "us-east-1a"
}

variable "instance_type" {
  type        = string
  description = "default instance size"
  default     = "t2.nano"
}

variable "ebs_size" {
  type        = number
  description = "default ebs size"
  default     = 40
}

variable "security_group_name" {
  type        = string
  description = "default security group name"
  default     = "lusianne-app-sg"
}
