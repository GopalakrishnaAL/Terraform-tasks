variable "ebs_volumes" {
  description = "List of maps with EBS volume configurations"
  type = list(object({
    device_name = string
    volume_size = number
    volume_type = string
  }))
  default = []
}

variable "availability_zone" {
  type = string
}

variable "instance_id" {
  description = "ID of the EC2 instance to attach EBS volumes to"
  type        = string
}