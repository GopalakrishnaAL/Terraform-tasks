resource "aws_cloudwatch_metric_alarm" "My_Alarm" {
  alarm_name                = var.alarm_name
  namespace                 = "AWS/EC2"
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  datapoints_to_alarm       = var.datapoints_to_alarm
  metric_name               = var.metric_name
  period                    = var.period
  statistic                 = var.statistic
  threshold                 = var.threshold
  alarm_description         = var.alarm_description
  ok_actions                = []
  alarm_actions             = []
  insufficient_data_actions = []
dimensions = {
    InstanceId = var.InstanceId
}
}