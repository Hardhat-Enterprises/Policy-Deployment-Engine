# Compliant Looker Core instance with custom domain for private connectivity
# This resource is compliant because custom_domain.domain is set when public_ip_enabled=false

resource "google_looker_instance" "c" {
  name              = "looker-core-compliant-custom-domain"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  private_ip_enabled = true # Assuming private connectivity
  project           = var.project
  custom_domain {
    domain = "looker.internal.company.com"
  }
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}
