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

provider "aws" {

  default_tags{
    tags = {
      Project = "mlModEval"
      ManagedBy = "terraform"
    }
  }
}