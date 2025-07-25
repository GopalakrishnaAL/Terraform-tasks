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
  vpc_id             = module.s3.vpc_id
  sg1_ingress_rules  = var.sg1_ingress_rules
  sg2_ingress_rules  = var.sg2_ingress_rules
}


output "EC2_availabilty_zone" {
  value = module.ec2.EC2_availabilty_zone
}

output "Ec2_Instance_id" {
  value = module.ec2.Ec2_Instance_id
}

module "CloudWatch_Alarm" {
  source = "../../modules/CloudWatch"

  alarm_name          = var.cpu_alarm_description
  alarm_description   = var.cpu_alarm_description
  comparison_operator = var.cpu_comparison_operator
  evaluation_periods  = var.cpu_evaluation_periods
  datapoints_to_alarm = var.cpu_datapoints_to_alarm
  metric_name         = var.cpu_metric_name
  period              = var.cpu_period
  statistic           = var.cpu_statistic
  threshold           = var.cpu_threshold
  InstanceId          = module.EC2_1.ec2_id
}

module "aws_cloudwatch_dashboard" {
  source = "../../modules/CloudWatch Dashboard"

  dashboard_name        = var.reg_dashboard_name
  dashboard_aws_region  = var.reg_dashboard_aws_region
  dashboard_instance_id = module.EC2_1.ec2_id
}

module "waf" {
  source = "../../modules/waf"

  name             = var.waf_name
  description      = var.waf_description
  scope            = var.waf_scope
  managed_rules    = var.waf_managed_rules
  custom_rules     = var.waf_custom_rules
  custom_or_rules  = var.waf_custom_or_rules
  tags             = var.tags
}