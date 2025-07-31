#EC2 variable
variable "instance_name" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

#EBS Variable
variable "availability_zone" {
  type = string
}

variable "instance_id" {
  type = string
}

variable "root_vol" {
  type = number
}
 
# EBS 
# variable "root_block_device" {
#   description = "List of EBS volume maps"
#   type = list(object({
#     device_name = string
#     volume_size = number
#     volume_type = string
#     encrypted   = bool
#   }))
# }

#VPC
variable "vpc_id" {
    type = string
}

#S3 Variable
variable "name" {
    type = string
}

variable "lifecycle_days" {
  type = number
}

#Security_Group Variables
variable "sg1_ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  }

variable "sg2_ingress_rules" {
  description = "List of ingress rules"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  }

  #CloudWatch CPU_Alarms
variable "alarm_name" {
  type = string
}

variable "alarm_description" {
  type = string
}

variable "comparison_operator" {
  type = string
}

variable "evaluation_periods" {
  type = number
}

variable "datapoints_to_alarm" {
  type = number
}

variable "metric_name" {
  type = string
}

variable "period" {
  type = number
}

variable "statistic" {
  type = string
}

variable "threshold" {
  type = number
}

#CloudWatch Dashboard
variable "dashboard_name" {
  type = string
}

variable "dashboard_aws_region" {
  type = string
}

variable "waf_name" {
  type = string
}

variable "waf_description" {
  type = string
}


variable "waf_scope" {
  type        = string
  description = "REGIONAL or CLOUDFRONT"
}

variable "waf_managed_rules" {
  type = list(object({
    name            = string
    priority        = number
    rule_group_name = string
    vendor_name     = string
  }))
  default = []
}

variable "waf_custom_rules" {
  type = list(object({
    name                  = string
    priority              = number
    action                = string
    match_field           = string
    positional_constraint = string
    search_string         = string
  }))
  default = []
}

variable "waf_custom_or_rules" {
  type = list(object({
    name     = string
    priority = number
    action   = string
    statements = list(object({
      match_field           = string
      positional_constraint = string
      search_string         = string
    }))
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}