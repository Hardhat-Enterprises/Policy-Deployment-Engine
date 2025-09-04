terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "fluent-coder-468700-h4"
  region  = "us-central1"
  zone    = "us-central1-c"
}