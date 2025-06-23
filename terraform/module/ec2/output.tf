output "EC2_availabilty_zone" {
  value = aws_instance.EC2.availability_zone
}

output "Ec2_Instance_id" {
  value = aws_instance.EC2.id
}