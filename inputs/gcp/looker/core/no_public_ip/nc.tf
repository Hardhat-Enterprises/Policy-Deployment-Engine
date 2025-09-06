# Non-compliant Looker Core instance with public IP enabled
# This resource is non-compliant because publicIpEnabled is set to true

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-public-ip"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = true
  project           = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

