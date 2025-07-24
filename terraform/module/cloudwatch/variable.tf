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

variable "InstanceId" {
  type = string
}