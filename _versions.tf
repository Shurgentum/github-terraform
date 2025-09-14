terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    region = "us-east-1"

    key    = "GitHub/terraform-github/terraform.tfstate"
    bucket = "shurgentum.tfstate"

    encrypt    = true
    kms_key_id = "426c9147-de02-423b-b7d6-e8775976dc68" # tfstate/encryption
  }
}

provider "github" {}
