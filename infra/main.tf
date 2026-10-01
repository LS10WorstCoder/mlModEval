terraform {
  required_version = "~> 1.16.0"

  cloud {
    organization = "ls10worstinfrastructure"
    workspaces {
      name = "mlModEval"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {}

resource "aws_s3_bucket" "artifacts" {
  bucket_prefix = "mlmodeval-artifacts-"
}