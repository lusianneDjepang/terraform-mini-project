resource "aws_eip" "lb" {
  instance = var.instance_id
  vpc      = true
  provisioner "local-exec" {
    command = "echo  PUBLIC IP: ${aws_eip.lb.public_ip} >> info.ec2.txt"
  }
}
