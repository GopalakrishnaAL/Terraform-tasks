resource "aws_ebs_volume" "root_block_device" {
  for_each = { for vol in var.root_volumes : vol.device_name => vol }

  availability_zone = var.availability_zone
  size              = each.value.volume_size
  type              = each.value.volume_type

  tags = {
    Name = "ebs-${each.key}"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
  for_each = aws_ebs_volume.root_block_device

  device_name = each.key
  volume_id   = each.value.id
  instance_id = var.instance_id
  force_detach = true
}