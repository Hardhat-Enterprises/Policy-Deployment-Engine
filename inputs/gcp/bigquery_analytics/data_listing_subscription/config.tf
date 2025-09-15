terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
  required_version = ">= 1.5.0"
}

provider "google" {
  project = "my-project"
  region  = "us-central1"
}
