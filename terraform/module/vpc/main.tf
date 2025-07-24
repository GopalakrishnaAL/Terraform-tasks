# Fetch the default VPC
data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}