terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.49.2"
    }
  }

  cloud {
    organization = "nowaorganizacja"
    token = "TERRAFORM_CLOUD_TOKEN"

    workspaces {
      name = "123"
    }
  }
}
