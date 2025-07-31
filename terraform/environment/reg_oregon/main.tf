module "ebs" {
  source    = "../../module/ebs"

  availability_zone  = module.ec2.EC2_availabilty_zone
  instance_id        = module.ec2.Ec2_Instance_id
}

module "ec2" {
  source    = "../../module/ec2"
  root_vol = var.root_vol
  instance_name     = var.instance_name
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  security_group_ids1 = [module.sg.SG_id1]
  security_group_ids2 = [module.sg.SG_id2]
}

# module "s3" {
#   source = "../../module/s3"

#   name    = var.name
#   vpc_id  = var.vpc_id
#   lifecycle_days = var.lifecycle_days
# }

module "sg" {
  source             = "../../module/sg"
  vpc_id             = module.vpc_id
  sg1_ingress_rules  = var.sg1_ingress_rules
  sg2_ingress_rules  = var.sg2_ingress_rules
}


output "EC2_availabilty_zone" {
  value = module.ec2.EC2_availabilty_zone
}

output "Ec2_Instance_id" {
  value = module.ec2.Ec2_Instance_id
}

module "cloudwatch" {
  source = "../../module/cloudwatch"

  alarm_name          = var.alarm_name
  alarm_description   = var.alarm_description
  comparison_operator = var.comparison_operator
  evaluation_periods  = var.evaluation_periods
  datapoints_to_alarm = var.datapoints_to_alarm
  metric_name         = var.metric_name
  period              = var.period
  statistic           = var.statistic
  threshold           = var.threshold
  InstanceId          = module.EC2_1.ec2_id
}

module "aws_cloudwatch_dashboard" {
  source = "../../module/cloudwatch dashboard"

  dashboard_name        = var.dashboard_name
  dashboard_aws_region  = var.dashboard_aws_region
  dashboard_instance_id = module.EC2_1.ec2_id
}

module "waf" {
  source = "../../module/waf"

  name             = var.waf_name
  description      = var.waf_description
  scope            = var.waf_scope
  managed_rules    = var.waf_managed_rules
  custom_rules     = var.waf_custom_rules
  custom_or_rules  = var.waf_custom_or_rules
  tags             = var.tags
}