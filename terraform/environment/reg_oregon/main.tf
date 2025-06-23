module "ebs" {
  source    = "../../module/ebs"

  # volume_size       = var.volume_size
  ebs_volumes       = var.ebs_volumes
  availability_zone = [module.ec2.availability_zone]
  instance_id       = [module.ec2.instance_id]
}

module "ec2" {
  source    = "../../module/ec2"

  instance_name     = var.instance_name
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  security_group_ids = [module.securitygroup.SG_id]
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
  vpc_id = [module.s3.vpc_id]
}