terraform {
    backend "s3" {
        bucket = "tfstate-rrhh"
        key = "terraform.tfstate"
        region = "us-west-1"
        encrypt = true
        dynamodb_table = "tfstate-dynamodb"
    }
}

# Provider AWS
provider "aws" {
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
    region = var.AWS_REGION
}