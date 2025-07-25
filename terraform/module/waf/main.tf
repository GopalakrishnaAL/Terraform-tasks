resource "aws_wafv2_web_acl" "oregon_WAF" {
  name        = var.name
  description = var.description
  scope       = var.scope

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.name}-metrics"
    sampled_requests_enabled   = true
  }

  # ─ Managed AWS Rule Groups ─
    dynamic "rule" {
    for_each = var.managed_rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

      override_action {
        none {}
      }

      statement {
        managed_rule_group_statement {
          name        = rule.value.rule_group_name
          vendor_name = rule.value.vendor_name
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = "${rule.value.name}-metrics"
        sampled_requests_enabled   = true
      }
    }
  }

  # ─ Simple Byte Match Rules ─
  dynamic "rule" {
    for_each = var.custom_rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

dynamic "action" {
  for_each = rule.value.action == "block" ? [1] : []
  content {
    block {}
  }
}

dynamic "action" {
  for_each = rule.value.action == "allow" ? [1] : []
  content {
    allow {}
  }
}

      statement {
  byte_match_statement {
    field_to_match {
      single_header {
        name = rule.value.match_field
      }
    }

    positional_constraint = rule.value.positional_constraint
    search_string         = rule.value.search_string

    text_transformation {
      priority = 0
      type     = "NONE"
    }
  }
}
      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = "${rule.value.name}-metric"
        sampled_requests_enabled   = true
      }
    }
  }

  # ─ OR-Logic Custom Rules ─
  dynamic "rule" {
    for_each = var.custom_or_rules
    content {
      name     = rule.value.name
      priority = rule.value.priority

dynamic "action" {
  for_each = rule.value.action == "block" ? [1] : []
  content {
    block {}
  }
}

dynamic "action" {
  for_each = rule.value.action == "allow" ? [1] : []
  content {
    allow {}
  }
}

      statement {
        or_statement {
          dynamic "statement" {
            for_each = rule.value.statements
            content {
              byte_match_statement {
  field_to_match {
    single_header {
      name = statement.value.match_field
    }
  }

  positional_constraint = statement.value.positional_constraint
  search_string         = statement.value.search_string
  
  text_transformation {
    priority = 0
    type     = "NONE"
  }
}
            }
          }
        }
      }

      visibility_config {
        cloudwatch_metrics_enabled = true
        metric_name                = "${rule.value.name}-metric"
        sampled_requests_enabled   = true
      }
    }
  }
  tags = var.tags
}