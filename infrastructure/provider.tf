terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.60.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  access_key = "YOUR_ACCESS_KEY"
  secret_access_key = "YOUR_SECRET_ACCESS_KEY"
}
