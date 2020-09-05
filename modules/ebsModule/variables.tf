variable az {
  type        = string
  description = "set AZ name"
  default     = "us-east-1a"
}

variable ebs_size {
  type        = string
  description = "set aws ebs size"
}

variable instance_id {
  type        = string
  description = "instance id to attache volume"
}
