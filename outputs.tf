output "dynamic_name" {
  value = local.dynamic_name 
}

output "workspace_name" {
    value = terraform.workspace  
}

output "eastus_from_list" {
  value = local.network_list[1]
}

output "eastus_from_map" {
  value = local.network_map["eastus"]  
}

output "app_server_ip" {
  value = module.webserver.public_ip  
}