#EC2 variable

variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "volume_size" {
  type = number
}

variable "ebs_volumes" {
  description = "List of EBS volume maps"
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
    encrypted   = bool
  }))
}

#S3 Variable

variable "tags" {
  type = map(string)
}

variable "name" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "lifecycle_days" {
  type = number
}