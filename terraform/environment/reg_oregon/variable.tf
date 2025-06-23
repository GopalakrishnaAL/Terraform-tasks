# #EC2 variable

# variable "instance_name" {
#   type = string
# }

# variable "ami_id" {
#   type = string
# }

# variable "instance_type" {
#   type = string
# }

# #EBS Variable

# variable "availability_zone" {
#   type = string
# }

# variable "instance_id" {
#   type = string
# }

# variable "reg_ebs_volumes" {
#   description = "List of EBS volume maps"
#   type = list(object({
#     device_name = string
#     volume_size = number
#     volume_type = string
#     encrypted   = bool
#   }))
# }

# #S3 Variable

# variable "name" {
#     type = string
# }

# variable "vpc_id" {
#     type = string
# }

# variable "lifecycle_days" {
#   type = number
# }

# #Security_Group Variables

# variable "ingress_rules" {
#   description = "List of ingress rules"
#   type = list(object({
#     from_port   = number
#     to_port     = number
#     protocol    = string
#     cidr_blocks = list(string)
#   }))
#   default = [
#     {
#       from_port   = 22
#       to_port     = 22
#       protocol    = "tcp"
#       cidr_blocks = ["0.0.0.0/0"]
#     }
#   ]
# }