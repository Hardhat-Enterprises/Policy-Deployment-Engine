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
  description = "Dummy GCP project ID for plan-only tests"
  type        = string
  default     = "dummy-project"
}
