module "reg_oregon" {
  source = "./environment/reg_oregon"

  providers = { aws = aws.oregon }

  # S3 Bucket Configuration
  name           = "test_bucket"
  vpc_id         = data.aws_vpc.default.id
  lifecycle_days = 15

  # EC2 Instance Configuration
  instance_name     = "test_instance"
  ami_id            = "ami-0fe630eb857a6ec83"
  instance_type     = "t3.medium"
  availability_zone = module.reg_oregon.EC2_availabilty_zone
  instance_id       = module.reg_oregon.Ec2_Instance_id


  # Security Group Rules
  ingress_rules = [ 
    {
      from_port   = 3389,
      to_port     = 3389,
      protocol    = "tcp",
      cidr_blocks = ["0.0.0.0/0"],
      description = "RDP access"
    }
  ]

  # EBS Volumes
  reg_ebs_volumes = [
    {
      device_name = "/dev/sdh",
      volume_size = 30,
      volume_type = "gp3"
      encrypted = true
    }#,
    # {
    #   device_name = "/dev/sdi",
    #   volume_size = 20,
    #   volume_type = "gp3"
    # }
  ]
}

data "aws_vpc" "default" {
  provider = aws.oregon
  default  = true
}