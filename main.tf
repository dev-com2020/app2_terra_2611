module "app_server" {
    source = "./modules/ec2_instance"
    
    instance_name = "tk_app-server"
    instance_type = "t2.micro"
    ami           = "ami-0a6793a25df710b06" # Amazon Linux 2 AMI EU-central-1
}

module "db_server" {
    source = "./modules/ec2_instance"
    
    instance_name = "tk_db-server"
    instance_type = "t2.micro"
    ami           = "ami-05a797deb2b0220d6" # Amazon Linux 2 AMI EU-central-1
}