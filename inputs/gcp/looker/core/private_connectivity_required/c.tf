# Compliant Looker Core instance with private connectivity
# This resource is compliant because private_ip_enabled=true and public_ip_enabled=false

resource "google_looker_instance" "c" {
  name               = "looker-core-compliant-private-connectivity"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  private_ip_enabled = true
  public_ip_enabled  = false
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