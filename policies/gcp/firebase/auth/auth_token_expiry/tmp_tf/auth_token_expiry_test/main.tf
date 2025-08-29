terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# Firebase Auth Tenant without expiry (policy should DENY)
resource "google_identity_platform_tenant" "test_tenant_no_expiry" {
  display_name          = "test-tenant-no-expiry"
  allow_password_signup = true
  # Missing expiry → triggers policy
}
