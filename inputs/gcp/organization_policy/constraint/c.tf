terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "dummy-project"
}

resource "google_organization_policy" "ok" {
  org_id     = "123456789012"
  constraint = "constraints/compute.disableSerialPortAccess"

  boolean_policy {
    enforced = true
  }
}
