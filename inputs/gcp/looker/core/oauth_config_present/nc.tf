# Non-compliant Looker Core instance with minimal OAuth config
# This resource is non-compliant because oauth_config has empty client_id and client_secret

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-no-oauth-config"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  
  # Minimal oauth_config block - violates policy (should be properly configured)
  oauth_config {
    client_id     = ""
    client_secret = ""
  }
}