terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
  }
}

provider "google-beta" {
  project = var.project_id
  region  = "us-central1"
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "test-project"
}

variable "site_id" {
  description = "Firebase hosting site ID"
  type        = string
  default     = "cors-policy-secure-site"
}
