# Compliant Looker Core instance with reserved range for PSA/PSC
# This resource is compliant because reserved_range is configured for private connectivity

resource "google_looker_instance" "c" {
  name              = "looker-core-compliant-reserved-range"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  private_ip_enabled = true # Required for reserved_range
  reserved_range    = "projects/test-project-123/global/addresses/test-reserved-range"
  project           = var.project
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}