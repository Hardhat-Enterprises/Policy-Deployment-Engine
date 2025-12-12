terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

# Minimal provider config (dummy values are fine for planning)
provider "google" {
  project = "pde-demo"
  region  = "us-central1"
}
