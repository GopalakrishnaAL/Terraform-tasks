variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "root_volume_size" {
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

variable "tags" {
  type = map(string)
}