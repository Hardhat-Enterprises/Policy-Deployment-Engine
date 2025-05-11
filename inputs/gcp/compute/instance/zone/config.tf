##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  # Newly added line
  credentials = file("${path.module}/../../../../../secrets/credentials.json")
}