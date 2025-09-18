terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 7.0"
    }
  }
}

provider "google-beta" {
  project = var.project_id
  region  = "us-central1"
}

variable "project_id" {
  description = "Dummy GCP project ID for testing"
  type        = string
  default     = "test-project"
}

variable "site_id" {
  description = "Firebase hosting site ID"
  type        = string
  default     = "headers-security-site"
}
