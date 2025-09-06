# Non-compliant Looker Core instance without maintenance window
# This resource is non-compliant because maintenance_window is not configured

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-no-maintenance-window"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  
  # No maintenance_window - violates policy
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
