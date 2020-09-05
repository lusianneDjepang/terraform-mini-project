resource "aws_ebs_volume" "my_ebs" {
  availability_zone = var.az
  size              = var.ebs_size
  tags = {
    Name = "miniProjet-elb-lusianne"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name  = "/dev/sdh"
  volume_id    = aws_ebs_volume.my_ebs.id
  instance_id  = var.instance_id
  force_detach = true
}
