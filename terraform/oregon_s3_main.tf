# Fetch default VPC in Oregon region
data "aws_vpc" "default" {
  default  = true
}

module "reg_oregon" {
  source    = "./environment/reg_oregon/s3"

  providers = { aws = aws.oregon }

  name    = "task-s3bucket-oregon"
  vpc_id  = data.aws_vpc.default.id
  lifecycle_days = "15"
}