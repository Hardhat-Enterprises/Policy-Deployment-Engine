terraform {
  required_version = ">= 1.5.0"

  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 7.0"
    }
  }
}

# Default avoids prompts during plan-only testing
variable "project_id" {
  type        = string
  default     = "dummy-project"
  description = "GCP project ID (dummy for plan-only tests)"
}

provider "google-beta" {
  project = var.project_id
  region  = "us-central1"
}
