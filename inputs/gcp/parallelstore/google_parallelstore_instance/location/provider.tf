terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.0.0"
    }
  }
}

provider "google" {
  project = "ornate-oven-398414"    # 👈 use the project ID you selected when logging in
  region  = "australia-southeast1"  # or any default region
}