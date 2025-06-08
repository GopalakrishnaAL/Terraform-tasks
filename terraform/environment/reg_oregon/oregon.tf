module "s3" {
  source = "../../modules/s3"

  name    = var.name
  vpc_id  = var.vpc_id
}