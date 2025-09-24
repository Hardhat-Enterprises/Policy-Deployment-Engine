terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 7.1.1"
    }
  }
  required_version = ">= 1.0"
}