# Compliant Looker Core instance with custom domain for private connectivity
# This resource is compliant because it has private connectivity (private_ip_enabled=true) with custom domain set

resource "google_looker_instance" "c" {
  name               = "looker-core-compliant-custom-domain"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = false
  private_ip_enabled = true
  project            = var.project
  
  # Custom domain for private connectivity
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
