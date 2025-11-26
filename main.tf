locals {
    project_name = "my-terraform-project"
    dynamic_name = "${var.env_name}-${random_string.random.result}"
}

resource "random_string" "random" {
    length =   4
    upper = false
    special = false
}