data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}


resource "aws_instance" "myec2" {
  availability_zone = var.az
  ami               = data.aws_ami.app_ami.id
  instance_type     = var.instance_type
  key_name          = var.key_name
  tags              = var.aws_common_tag
  security_groups   = ["${var.sg}"]


  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("./devops-lusianne.pem")
    host        = self.public_ip
  }
}
