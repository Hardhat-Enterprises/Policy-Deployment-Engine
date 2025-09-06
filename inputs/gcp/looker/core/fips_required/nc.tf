# Non-compliant Looker Core instance without FIPS enabled
# This resource is non-compliant because fips_enabled is set to false

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-fips-disabled"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  fips_enabled      = false
  project           = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}