terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket = "tk0-my-terraform-state-bucket"
    key    = "global/s3/terraform.tfstate"
    region = "eu-central-1"
    dynamodb_table = "terraform-state-lock-dynamo"
  }
}

provider "aws" {
  region = "eu-central-1"
}