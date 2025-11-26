locals {
    project_name = "my-terraform-project"
    dynamic_name = "${var.env_name}-${random_string.random.result}"
    network_list = [
        {name = "net-a", cidr = "10.0.0.0/16"},
        {name = "net-b", cidr = "10.1.0.0/16"}
    ]
    network_map = {
        "westus" = "net-a"
        "eastus" = "net-b"
        "eastus" = "net-xxx"
    }

    region_names_list = [for r in var.regions : upper(r)]
    region_array_from_map = [for k, v in var.region_map : "${k}-${v}"]
}


resource "random_string" "random" {
    length =   5
    upper = false
    special = true
}