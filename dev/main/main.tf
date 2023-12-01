module "VPC" {
  source      = "../../modules/main/VPC"
  vpc_cidr    = "10.0.0.0/16"
  public_cidr = ["10.0.10.0/24", "10.0.16.0/24"]
  privat_cidr = [
    "10.0.11.0/24",
    "10.0.17.0/24"
  ]
}

module "SG" {
  source     = "../../modules/main/S_Group"
  vpc_id     = module.VPC.vpc_id
  alow_ports = ["80", "443", "179", "5432"]
  depends_on = [module.VPC]
}


module "ASG" {
  source              = "../../modules/main/AutoSG"
  vpc_zone_identifier = module.VPC.Public_ids
  SGroup_id           = module.SG.Securitygroup_id
  owners              = ["137112412989"]
  values              = ["al2023-ami-*-kernel-6.1-x86_64"]
  instance            = "t2.micro"
  min                 = "3"
  max                 = "4"
  depends_on          = [module.VPC, module.SG]
}

module "lb" {
  source           = "../../modules/main/lb"
  security_groups  = module.SG.Securitygroup_id
  subnets          = module.VPC.Public_ids
  vpc_id           = module.VPC.vpc_id
  domain_name      = "example.com"
  domain_name_app2 = "example.com/app2"
  domain_name_app3 = "example.com/app3"
}


module "ECS" {
  source                 = "../../modules/main/ECS-Cluster"
  auto_scaling_group_arn = module.ASG.AG_arn
}

module "RDS" {
  source                 = "../../modules/main/RDS"
  privat_ids             = module.VPC.Private_ids
  vpc_security_group_ids = module.SG.Securitygroup_id
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "aurora-mysql"
  engine_version         = "5.7.mysql_aurora.2.03.2"
  instance_class         = "db.t2.micro"
  depends_on             = [module.VPC, module.SG]
}

module "Logs" {
  source = "../../modules/main/Logs"
}
