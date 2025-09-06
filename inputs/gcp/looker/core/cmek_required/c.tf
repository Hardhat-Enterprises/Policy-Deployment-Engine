# Compliant Looker Core instance with CMEK enabled
# This resource is compliant because encryption_config.kms_key_name is set

resource "google_looker_instance" "c" {
  name              = "looker-core-compliant-cmek"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  encryption_config {
    kms_key_name = "projects/test-project-123/locations/us-central1/keyRings/test-keyring/cryptoKeys/test-key"
  }
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}