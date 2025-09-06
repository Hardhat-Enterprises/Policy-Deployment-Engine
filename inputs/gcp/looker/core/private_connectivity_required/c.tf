# Compliant Looker Core instance with private connectivity
# This resource is compliant because privateIpEnabled=true and publicIpEnabled=false

resource "google_looker_instance" "c" {
  name               = "looker-core-compliant-private-connectivity"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = false
  private_ip_enabled = true
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
