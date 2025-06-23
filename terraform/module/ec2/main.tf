resource "aws_instance" "EC2" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  vpc_security_group_ids = var.Dynamic_security_group_ids

  metadata_options {
    http_tokens = "required" # Enforce IMDSv2
  }

  tags = {
    Name        = "${var.ec2_name_prefix}-ec2"
    Environment = "JM"
    ManagedBy   = "Terraform"
  }
}