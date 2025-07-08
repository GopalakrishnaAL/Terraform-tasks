# module "reg_oregon" {
#   source = "./environment/reg_oregon"

#   providers = { aws = aws.oregon }

#   # S3 Bucket Configuration
#   name           = "gopal-1-bucket"
#   vpc_id         = data.aws_vpc.default.id
#   lifecycle_days = 15

#   # EC2 Instance Configuration
#   instance_name     = "test_instance"
#   ami_id            = "ami-0992e77a19022a98d"
#   instance_type     = "t3.micro"
#   availability_zone = module.reg_oregon.EC2_availabilty_zone
#   instance_id       = module.reg_oregon.Ec2_Instance_id
#   root_vol = "80"

#   # Security Group Rules
#   sg1_ingress_rules = [ 
#     {
#       from_port   = 95,
#       to_port     = 95,
#       protocol    = "tcp",
#       cidr_blocks = ["0.0.0.0/0"],
#       description = "RDP access"
#     }    
#   ]
#   sg2_ingress_rules = [ 
#     {
#       from_port   = 12,
#       to_port     = 12,
#       protocol    = "tcp",
#       cidr_blocks = ["0.0.0.0/0"],
#       description = "RDP access"
#     }    
#   ]

#   # EBS Volumes
# #   reg_ebs_volumes = [
# #     {
# #       device_name = "/dev/sdh",
# #       volume_size = 30,
# #       volume_type = "gp3"
# #       encrypted = true
# #     },
# #     {
# #       device_name = "/dev/sdi",
# #       volume_size = 20,
# #       volume_type = "gp3"
# #       encrypted = true
# #     }
# #   ]
# }

# data "aws_vpc" "default" {
#   provider = aws.oregon
#   default  = true
# }
