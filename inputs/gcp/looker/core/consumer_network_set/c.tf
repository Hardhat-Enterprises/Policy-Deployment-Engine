# Compliant Looker Core instance with consumer network set for private connectivity
# This resource is compliant because it has private connectivity with consumer_network configured

resource "google_looker_instance" "c" {
  name               = "looker-core-compliant-consumer-network"
  platform_edition   = "LOOKER_CORE_STANDARD_ANNUAL"
  region             = "us-central1"
  public_ip_enabled  = false
  private_ip_enabled = true
  project            = var.project
  
  # Consumer network for private connectivity
  consumer_network = "projects/test-project-123/global/networks/test-vpc"
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

variable "project" {
  type = string
}
