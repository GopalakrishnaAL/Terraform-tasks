module "s3" {
  source = "../../module/s3"

  name    = var.name
  vpc_id  = var.vpc_id
  lifecycle_days = var.lifecycle_days
}