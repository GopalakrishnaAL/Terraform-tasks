# Fetch default VPC in Oregon region
data "aws_vpc" "default" {
  provider = aws.oregon
  default  = true
}

module "reg_oregon" {
  source    = "./environment/reg_oregon"
  providers = { aws = aws.oregon }

  name    = task_s3bucket_oregon
  vpc_id  = data.aws_vpc.default.id
}