terraform {
  required_version = ">= 1.5.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.17.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Environment = "Development"
      Owner       = "OPSD-terraformers"
    }
  }
}
