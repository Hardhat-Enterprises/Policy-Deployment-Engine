terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

 
provider "google" {
  project = "pde-demo"
  region  = "us-central1"
}
