module "vpc" {
  source = "./modules/vpc"

  vpc_name        = var.vpc_name
  cidr            = var.cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  tags            = merge(local.common_tags, { Component = "network" })
}

module "nat" {
  source = "./modules/nat"

  public_subnet       = module.vpc.public_subnets[0]
  private_route_table = module.vpc.private_route_table_ids[0]
  name                = "${local.name_prefix}-nat"
  tags                = merge(local.common_tags, { Component = "egress" })
}

module "alb" {
  source = "./modules/alb"

  vpc_id              = module.vpc.vpc_id
  public_subnets      = module.vpc.public_subnets
  name                = "${local.name_prefix}-alb"
  security_group_name = "${local.name_prefix}-alb-sg"
  tags                = merge(local.common_tags, { Component = "ingress" })
}

module "rds" {
  source = "./modules/rds"

  private_subnets   = module.vpc.private_subnets
  identifier        = "${local.name_prefix}-postgres"
  subnet_group_name = "${local.name_prefix}-db-subnet"
  username          = var.db_username
  password          = var.db_password
  tags              = merge(local.common_tags, { Component = "database" })
}

