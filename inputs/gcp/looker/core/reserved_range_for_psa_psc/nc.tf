# Non-compliant Looker Core instance without reserved range for private connectivity
# This resource is non-compliant because it has private connectivity but no reserved_range

resource "google_looker_instance" "nc" {
  name               = "looker-core-noncompliant-no-reserved-range"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = false
  private_ip_enabled = true
  project            = var.project
  
  # No reserved_range - violates policy for private connectivity
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
