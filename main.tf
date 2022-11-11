
module "networking" {
    source = "./networking"
}


module "compute" {
    source = "./compute"
    security_group_id = [module.networking.security_group_id]
    subnet_group_id = module.networking.security_group_id
    host_os = var.hosh_os
    node_name = "main"
    key_name = "main-key"
    instance_type = "t2.micro"
}

module "derek-dev" {
    source = "./compute"
    security_group_id = [module.networking.security_group_id]
    subnet_group_id = module.networking.security_group_id
    host_os = var.hosh_os
    node_name = "derek"
    key_name = "derek-key"
    instance_type = "t2.micro"
}
