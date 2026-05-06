terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "7.28.0"
    }
  }
}

provider "google" {
  project = "my-project-123"
}