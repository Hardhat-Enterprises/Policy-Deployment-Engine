# Compliant Looker Core instance with reserved range for private connectivity
# This resource is compliant because it has private connectivity with reserved_range configured

resource "google_looker_instance" "c" {
  name               = "looker-core-compliant-reserved-range"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = false
  private_ip_enabled = true
  project            = var.project
  
  # Reserved range for Private Service Access/PSC
  reserved_range = "projects/test-project-123/global/addresses/test-reserved-range"
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}
