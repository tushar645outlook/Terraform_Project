terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.0.0-beta2"
    }
  }

}

provider "aws" {
  region = "ap-south-1"
}


