locals {
    project_name = "my-terraform-project"
    dynamic_name = "${var.env_name}-${random_string.random.result}"
}

resource "random_string" "random" {
    length =   5
    upper = false
    special = true
}