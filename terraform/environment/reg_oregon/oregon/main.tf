module "ec2" {
  source    = "../../module/ec2"

  instance_name     = var.instance_name
  instance_type     = var.instance_type
  ami               = var.ami_id
  vpc_security_group_ids = var.Dynamic_security_group_ids
}

module "ebs" {
  source    = "../../module/ebs"

  volume_size       = var.volume_size
  ebs_volumes       = var.ebs_volumes
  tags              = var.tags
}

module "s3" {
  source = "../../module/s3"

  name    = var.name
  vpc_id  = var.vpc_id
  lifecycle_days = var.lifecycle_days
}