terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "janekkamanek"

    workspaces {
      name = "asda"
    }
}
}