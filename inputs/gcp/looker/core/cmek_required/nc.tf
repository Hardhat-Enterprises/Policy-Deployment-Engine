# Non-compliant Looker Core instance without CMEK
# This resource is non-compliant because encryption_config block is missing

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-no-cmek"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  # Missing encryption_config block - uses default Google-managed encryption
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}