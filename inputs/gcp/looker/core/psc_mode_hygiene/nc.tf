# Non-compliant Looker Core instance with PSC mode hygiene violation
# This resource is non-compliant because psc_enabled=true but public_ip_enabled=true (violates PSC exclusivity)

resource "google_looker_instance" "nc" {
  name               = "looker-core-noncompliant-psc-hygiene"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  psc_enabled        = true
  public_ip_enabled  = true
  private_ip_enabled = false
  project            = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
