variable "instance_name" {
  type = string
}

variable "instance_type" {
  type    = string
}

variable "ami_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}