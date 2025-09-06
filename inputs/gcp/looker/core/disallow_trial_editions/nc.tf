# Non-compliant Looker Core instance with trial platform edition
# This resource is non-compliant because platform_edition is a trial SKU

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