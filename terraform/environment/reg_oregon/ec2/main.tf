module "ec2" {
  source    = "../../module/ec2"
  providers = { aws = aws.oregon }

  instance_name     = var.instance_name
  instance_type     = var.instance_type
  root_volume_size  = var.root_volume_size
  ebs_volumes       = var.ebs_volumes
  tags              = var.tags
}