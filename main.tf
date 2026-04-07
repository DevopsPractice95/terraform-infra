module "ec2" {

  source = "./modules/ec2"

  ami               = var.ami
  instance_type     = var.instance_type
  instance_name     = var.instance_name
  subnet_id         = module.subnet.subnet_id
  key_name          = var.key_name
  security_group_id = module.security_group.sg_id

}

module "s3" {

  source = "./modules/s3"

  bucket_name = var.bucket_name

}

module "vpc" {

  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr

}

module "subnet" {

  source = "./modules/subnet"

  vpc_id      = module.vpc.vpc_id
  subnet_cidr = var.subnet_cidr

}

module "igw" {

  source = "./modules/igw"

  vpc_id = module.vpc.vpc_id

}

module "route_table" {

  source = "./modules/route-table"

  vpc_id    = module.vpc.vpc_id
  igw_id    = module.igw.igw_id
  subnet_id = module.subnet.subnet_id

}

module "security_group" {

  source = "./modules/security-group"

  vpc_id = module.vpc.vpc_id

}