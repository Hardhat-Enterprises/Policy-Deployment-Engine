##### DO NOT EDIT ######

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project = "ankita-firebase-web-app"
  region  = "us-central1" 
}