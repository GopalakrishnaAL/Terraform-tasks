resource "aws_cloudwatch_dashboard" "ec2_dashboard" {
  dashboard_name = var.dashboard_name

  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x    = 0,
        y    = 0,
        width = 12,
        height = 6,
        properties = {
          title = "EC2 CPU Utilization",
          view = "timeSeries",
          stacked = false,
          metrics = [
            [ "AWS/EC2", "CPUUtilization", "InstanceId", var.dashboard_instance_id ]
          ],
          region = var.dashboard_aws_region,
          period = 300,
          stat   = "Average"
        }
      },
      {
        type = "metric",
        x    = 0,
        y    = 6,
        width = 12,
        height = 6,
        properties = {
          title = "EC2 Network In/Out",
          view = "timeSeries",
          stacked = false,
          metrics = [
            [ "AWS/EC2", "NetworkIn", "InstanceId", var.dashboard_instance_id ],
            [ ".",      "NetworkOut", ".", "." ]
          ],
          region = var.dashboard_aws_region,
          period = 300,
          stat   = "Sum"
        }
      }
    ]
  })
}