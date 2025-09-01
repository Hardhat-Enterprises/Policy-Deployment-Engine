terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"   # or whatever version you’re using
    }
  }
}

provider "google" {
  project = "focus-dragon-406513-m2"   # replace with your project ID
  region  = "us-central1"
}
