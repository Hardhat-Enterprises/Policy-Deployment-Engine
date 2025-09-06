# Non-compliant Looker Core instance with trial edition
# This resource is non-compliant because it uses a trial platform edition

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-trial-edition"
  platform_edition  = "LOOKER_CORE_TRIAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
