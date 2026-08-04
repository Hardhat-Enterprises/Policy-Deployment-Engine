##### DO NOT EDIT #####

terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    tls = {
      source = "hashicorp/tls"
    }
  }
}

provider "google" {}
