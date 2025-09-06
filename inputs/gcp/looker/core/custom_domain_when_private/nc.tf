# Non-compliant Looker Core instance without custom domain for private connectivity
# This resource is non-compliant because custom_domain block is missing when public_ip_enabled=false

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-no-custom-domain"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  private_ip_enabled = true # Assuming private connectivity
  project           = var.project
  # Missing custom_domain block
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}