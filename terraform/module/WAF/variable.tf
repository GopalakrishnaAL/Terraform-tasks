variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "scope" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "managed_rules" {
  type = list(object({
    name            = string
    priority        = number
    rule_group_name = string
    vendor_name     = string
  }))
  default = []
}

variable "custom_rules" {
  description = "Custom WAF rules (simple byte match)"
  type = list(object({
    name                  = string
    priority              = number
    action                = string  # allow or block
    match_field           = string
    positional_constraint = string
    search_string         = string
  }))
  default = []
}

variable "custom_or_rules" {
  description = "Custom WAF rules with OR logic (multiple conditions in one rule)"
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