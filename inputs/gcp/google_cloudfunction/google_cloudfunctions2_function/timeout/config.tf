terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "your-gcp-project-id"
  region  = "us-central1"                             
}