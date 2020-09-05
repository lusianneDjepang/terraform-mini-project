provider "aws" {
  region     = "us-east-1"
  access_key = "PUT-YOUR_OWN-ACCESS_KEY"
  secret_key = "PUT-YOUR_OWN-SECRET_KEY"
}
terraform {
  backend "s3" {
    bucket     = "terraform-backend-lusianne"
    key        = "lusianne-app.tfstate"
    region     = "us-east-1"
    access_key = "PUT-YOUR_OWN-ACCESS_KEY"
    secret_key = "PUT-YOUR_OWN-SECRET_KEY"
  }
}
module "ec2" {
  source         = "../modules/ec2Module"
  az             = var.az
  instance_type  = "t2.nano"
  aws_common_tag = var.aws_common_tag
  sg             = "${module.sg.aws_security_group}"
}
module "eip" {
  source      = "../modules/ipPublicModule"
  instance_id = "${module.ec2.instance_id}"
}

module "sg" {
  source  = "../modules/sgModule"
  sg_name = var.security_group_name

}
module "ebs" {
  source      = "../modules/ebsModule"
  az          = var.az
  ebs_size    = var.ebs_size
  instance_id = "${module.ec2.instance_id}"
}
