terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}

provider "google" {
  project = "fluent-coder-468700-h4"
  region  = "us-central1"
}

# Compliant - follows naming convention
resource "google_gke_backup_backup_plan" "compliant" {
  name = "my-backup-plan-123"  # lowercase, starts with letter
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"
  
  retention_policy {
    backup_retain_days = 7
  }
}

# Non-compliant - bad naming
resource "google_gke_backup_backup_plan" "non_compliant" {
  name = "BadName_123"  # Contains uppercase and underscore - non-compliant!
  cluster = "projects/fluent-coder-468700-h4/locations/us-central1/clusters/test-cluster"
  location = "us-central1"
  
  retention_policy {
    backup_retain_days = 7
  }
}