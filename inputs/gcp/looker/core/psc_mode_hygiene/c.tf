# Compliant Looker Core instance with PSC mode hygiene
# This resource is compliant because psc_enabled=true with public_ip_enabled=false and private_ip_enabled=false

resource "google_looker_instance" "c" {
  name               = "looker-core-compliant-psc-hygiene"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  psc_enabled        = true
  public_ip_enabled  = false
  private_ip_enabled = false
  project            = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}