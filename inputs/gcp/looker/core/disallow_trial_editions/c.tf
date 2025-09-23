# Compliant Looker Core instance with production platform edition
# This resource is compliant because platform_edition is not a trial SKU

resource "google_looker_instance" "c" {
  name = "c1"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  project           = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}






