terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project      = "dummy-project"
  region       = "australia-southeast1"
  access_token = "dummy-token"
}