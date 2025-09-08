terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "focus-dragon-406513-m2"
  region  = "us-central1"
}

provider "google-beta" {
  project = "focus-dragon-406513-m2"
  region  = "us-central1"
}