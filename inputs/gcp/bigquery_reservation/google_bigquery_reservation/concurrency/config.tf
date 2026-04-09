terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "pde-dummy-project"
  region  = "us-central1"
}
