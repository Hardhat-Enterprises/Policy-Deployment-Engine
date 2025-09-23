terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.15.0"
    }
  }

  # required_version = ">= 1.3.0"
}

provider "google" {
#   project = "your-gcp-project-id"
#   region  = "us-central1"
}