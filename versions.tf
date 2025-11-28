terraform {
  backend "s3" {
    bucket = "tk0-my-terraform-state-bucket"
    key    = "./terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }


  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  
}

provider "aws" {
  region = "eu-central-1"
}