terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project      = "example-project"
  access_token = "fake-token"
}