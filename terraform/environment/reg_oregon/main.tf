module "ebs" {
  source    = "../../module/ebs"

  #volume_size       = var.volume_size
  ebs_volumes        = var.reg_ebs_volumes
  availability_zone  = module.ec2.EC2_availabilty_zone
  instance_id        = module.ec2.Ec2_Instance_id
}

module "ec2" {
  source    = "../../module/ec2"

  instance_name     = var.instance_name
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  security_group_ids = [module.sg.SG_id]
}

module "s3" {
  source = "../../module/s3"

  name    = var.name
  vpc_id  = var.vpc_id
  lifecycle_days = var.lifecycle_days
}

module "sg" {
  source = "../../module/sg"

  ingress_rules = var.ingress_rules
  vpc_id = module.s3.vpc_id
}

output "EC2_availabilty_zone" {
  value = module.ec2.EC2_availabilty_zone
}

output "Ec2_Instance_id" {
  value = module.ec2.Ec2_Instance_id
}