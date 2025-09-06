# Non-compliant Looker Core instance without OAuth config
# This resource is non-compliant because oauth_config is missing

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
