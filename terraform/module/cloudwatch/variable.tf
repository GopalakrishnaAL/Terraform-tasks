variable "instance_id" {
  description = "ID of the EC2 instance to monitor"
  type        = string
}

variable "instance_name" {
  description = "Name of the EC2 instance (used in alarm names)"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU utilization threshold (%)"
  type        = number
  default     = 80
}

variable "sns_topic_arn" {
  description = "SNS topic ARN for alarm notifications"
  type        = string
  default     = null
}