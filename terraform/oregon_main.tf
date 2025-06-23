# Fetch default VPC in Oregon region
data "aws_vpc" "default" {
  default = true
}

# S3 Module
module "oregon_s3" {
  source    = "./environment/reg_oregon/s3"
  providers = { aws = aws.oregon }

  name           = "task-s3bucket-oregon"
  vpc_id         = data.aws_vpc.default.id
  lifecycle_days = 15
}

# EC2 Module
module "oregon_ec2" {
  source    = "./environment/reg_oregon/ec2"
  providers = { aws = aws.oregon }

  name              = "test-instance"
  ami               = "ami-0fe630eb857a6ec83" # Windows Server 2019 in us-west-2
  instance_type     = "t3.medium"
  availability_zone = "us-west-2a" # Use specific AZ or module output

  ingress_rules = [
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "RDP access"
    }
  ]

  ebs_volumes = [
    {
      device_name = "/dev/sdh"
      volume_size = 30
      volume_type = "gp3"
    },
    {
      device_name = "/dev/sdi"
      volume_size = 20
      volume_type = "gp3"
    }
  ]
}