# Compliant Looker Core instance with OAuth config present
# This resource is compliant because oauth_config is properly configured

resource "google_looker_instance" "c" {
  name              = "looker-core-compliant-oauth-config"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  
  # OAuth configuration present
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}
