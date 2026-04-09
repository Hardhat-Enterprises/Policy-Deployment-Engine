terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.3.0"
    }
  }
}

provider "google" {
  # project = "your-gcp-project-id"
  # region  = "us-central1"
}