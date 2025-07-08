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