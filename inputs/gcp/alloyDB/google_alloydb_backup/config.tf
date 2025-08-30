terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Minimal provider config just for planning
provider "google" {
  project = "pde-demo"
  region  = "us-central1"
}
