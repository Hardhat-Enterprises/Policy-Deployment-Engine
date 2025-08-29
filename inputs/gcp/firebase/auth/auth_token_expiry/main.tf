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

# Firebase Auth Tenant without expiry (to trigger DENY)
resource "google_identity_platform_tenant" "test_tenant" {
  display_name = "test-tenant"
  allow_password_signup = true

  # NOTE: We're NOT setting expiry → should fail policy
}
