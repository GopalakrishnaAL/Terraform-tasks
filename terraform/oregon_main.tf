data "aws_vpc" "default" {
  provider = aws.oregon
  default  = true
}

module "reg_oregon" {
  source = "./environment/reg_oregon"

  providers = { aws = aws.oregon }

  # VPC
  vpc_id         = data.aws_vpc.default.id

  # EC2 Instance Configuration
  instance_name     = "test_instance"
  ami_id            = "ami-0992e77a19022a98d"
  instance_type     = "t3.micro"
  availability_zone = module.reg_oregon.EC2_availabilty_zone
  instance_id       = module.reg_oregon.Ec2_Instance_id
  root_vol = "80"

  # Security Group Rules
  sg1_ingress_rules = [ 
    {
      from_port   = 95,
      to_port     = 95,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
      description = "RDP access"
    }    
  ]
  sg2_ingress_rules = [ 
    {
      from_port   = 12,
      to_port     = 12,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
      description = "RDP access"
    }    
  ]
}

#  # S3 Bucket Configuration
#   name           = "gopal-1-bucket"
#   lifecycle_days = 15

#   EBS Volumes
#   reg_ebs_volumes = [
#     {
#       device_name = "/dev/sdh",
#       volume_size = 30,
#       volume_type = "gp3"
#       encrypted = true
#     },
#     {
#       device_name = "/dev/sdi",
#       volume_size = 20,
#       volume_type = "gp3"
#       encrypted = true
#     }
#   ]

#CloudWatch CPU_Utilization
  cpu_alarm_name          = "CPU_Utilization"
  cpu_alarm_description   = "CPU_Utilzation_Crossed_90%"
  cpu_comparison_operator = "GreaterThanOrEqualToThreshold"
  cpu_evaluation_periods  = 5
  cpu_datapoints_to_alarm = 3
  cpu_metric_name         = "CPUUtilization"
  cpu_period              = 60
  cpu_statistic           = "Maximum"
  cpu_threshold           = 90

#CloudWatch Dashboard
  reg_dashboard_name        = "Oregon_EC2_Dashboard"
  reg_dashboard_aws_region  = "eu-west-2"

#WAF
  waf_name        = "waf-oregon"
  waf_description = "Initial WAF deployment for oregon region"
  waf_scope       = "REGIONAL"

  waf_managed_rules = [
    {
      name            = "AWSManagedRulesCommonRuleSet"
      priority        = 1
      rule_group_name = "AWSManagedRulesCommonRuleSet"
      vendor_name     = "AWS"
    },
    {
      name            = "AWSManagedRulesAmazonIpReputationList"
      priority        = 2
      rule_group_name = "AWSManagedRulesAmazonIpReputationList"
      vendor_name     = "AWS"
    }
  ]

  waf_custom_rules = [
    {
    name                  = "block-host-header"
    priority              = 3
    action                = "block"
    match_field           = "host"           
    positional_constraint = "EXACTLY"
    search_string         = "sample.com"
    }
  ]

  waf_custom_or_rules = [
    {
      name     = "AllowSpecificHosts"
      priority = 4
      action   = "allow"
      statements = [
        {
          match_field           = "host"
          positional_constraint = "EXACTLY"
          search_string         = "sample1.com"
        },
        {
          match_field           = "host"
          positional_constraint = "EXACTLY"
          search_string         = "sample2.com"
        },
        {
          match_field           = "host"
          positional_constraint = "EXACTLY"
          search_string         = "sample3.com"
        },
        {
          match_field           = "host"
          positional_constraint = "EXACTLY"
          search_string         = "sample4.com"
        }
      ]
    }
  ]

  tags = {
    Environment = "P"
    Project     = "Oregon"
  }