module "oregon" {
  source = "./environment/reg_oregon"

  providers = { aws = aws.oregon }

  # S3 Bucket Configuration
  name = "test_bucket" 
  vpc_id = data.aws_vpc.default.id
  lifecycle_days = 15

  # EC2 Instance Configuration
  ec2_name         = "test_instance"
  ami_id           = "ami-0fe630eb857a6ec83"  # Windows Server 2019 in us-west-2
  instance_type    = "t3.medium"
  availability_zone = "us-west-2a"
  
  # Security Group Rules
  ingress_rules = [ 
    {
      from_port    = 3389,
      to_port      = 3389,
      protocol     = "tcp",
      cidr_blocks  = ["0.0.0.0/0"],
      description  = "RDP access"
    }
  ]

  # EBS Volumes
  ebs_volumes = [
    {
      device_name = "/dev/sdh",
      volume_size = 30,
      volume_type = "gp3"
    },
    {
      device_name = "/dev/sdi",
      volume_size = 20,
      volume_type = "gp3"
    }
  ]
}

# Fetch default VPC in Oregon region
data "aws_vpc" "default" {
  provider = aws.oregon
  default  = true
}