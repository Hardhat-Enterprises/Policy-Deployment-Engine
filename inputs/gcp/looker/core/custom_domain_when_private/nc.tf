# Non-compliant Looker Core instance without custom domain for private connectivity
# This resource is non-compliant because it has private connectivity but no custom domain

resource "google_looker_instance" "nc" {
  name               = "looker-core-noncompliant-no-custom-domain"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = false
  private_ip_enabled = true
  project            = var.project
  
  # No custom_domain block - violates policy for private connectivity
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
