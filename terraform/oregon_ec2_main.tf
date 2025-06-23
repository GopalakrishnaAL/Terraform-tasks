module "reg_oregon" {
  source = "./environment/reg_oregon/ec2"

  providers = { aws = aws.oregon }

  instance_name   = test-instance
  ami_id            = ami-0fe630eb857a6ec83 # Example: Windows Server 2019 in us-west-2 (Oregon)
  instance_type     = t3.medium
  availability_zone = module.Reg_Oregon_Windows_EC2.ec2_az

  ingress_rules = [
    {
      from_port   = 3389
      to_port     = 3389
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
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