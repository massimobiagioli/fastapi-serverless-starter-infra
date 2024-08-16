provider "aws" {
  region = var.aws_params["region"]
}

terraform {
  required_providers {
    aws = {
      version = ">= 5.5.0"
      source  = "hashicorp/aws"
    }
  }

  required_version = "~> 1.0"

  backend "s3" {
    bucket         = "fastapi-starter-dev-tfstate"
    key            = "pipeline/fastapi-starter-dev/terraform.tfstate"
    dynamodb_table = "fastapi-starter-dev-tfstate-locks"
    region         = "eu-west-1"
    encrypt        = true
  }
}
