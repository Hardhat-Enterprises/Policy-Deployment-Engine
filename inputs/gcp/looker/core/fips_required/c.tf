# Compliant Looker Core instance with FIPS enabled
# This resource is compliant because fips_enabled is set to true

resource "google_looker_instance" "c" {
  name = "c1"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  fips_enabled      = true
  project           = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}






