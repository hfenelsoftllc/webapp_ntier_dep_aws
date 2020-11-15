module "autoscaling" {
  source = "./modules/autoscaling"
  namespace = var.namespace
  ssh_keypair = var.ssh_keypair

  vpc = module.networking.vpc
  sg = module.networking.sg
  db_config = module.database.db_config
}
#step 2
module "database" {
  source = "./modules/database"
  namespace = var.namespace

  vpc = module.networking.vpc
  sg = module.networking.sg
}

#step 1
module "networking" {
  source    = "./modules/networking"
  namespace = var.namespace
}