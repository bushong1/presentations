locals {
  server_config = {
    dog : { instance_type = "m3.large" }
    cat : { instance_type = "m3.medium" }
    lizard : { instance_type = "m3.small" }
  }
}

module "ami" {
  source = "./ami-lookup"
}

module "my-servers" {
  source   = "./my-server"
  for_each = local.server_config

  ami_id               = module.ami.ubuntu
  server_name          = "server-${each.key}"
  server_instance_type = each.value.instance_type
}

