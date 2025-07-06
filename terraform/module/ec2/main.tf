resource "aws_instance" "EC2" {
  ami                     = var.ami_id
  instance_type           = var.instance_type
  vpc_security_group_ids = concat(var.security_group_ids1, var.security_group_ids2)

  metadata_options {
    http_tokens = "required" # Enforce IMDSv2
  }

  tags = {
    Name        = "${var.instance_name}-ec2"
    Environment = "asgk"
    ManagedBy   = "Terraform"
  }
}