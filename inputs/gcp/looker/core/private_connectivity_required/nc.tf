# Non-compliant Looker Core instance without proper private connectivity
# This resource is non-compliant because all connectivity options are false

resource "google_looker_instance" "nc" {
  name               = "looker-core-noncompliant-no-private-connectivity"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = true
  private_ip_enabled = false
  psc_enabled        = false
  project            = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
