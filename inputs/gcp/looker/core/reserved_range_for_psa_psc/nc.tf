# Non-compliant Looker Core instance without reserved range
# This resource is non-compliant because reserved_range is missing for private connectivity

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-no-reserved-range"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  private_ip_enabled = true # Private connectivity but no reserved_range
  project           = var.project
  # Missing reserved_range field
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}