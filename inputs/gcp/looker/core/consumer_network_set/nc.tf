# Non-compliant Looker Core instance without consumer network
# This resource is non-compliant because consumer_network is missing for private connectivity

resource "google_looker_instance" "nc" {
  name              = "looker-core-noncompliant-no-consumer-network"
  platform_edition  = "LOOKER_CORE_STANDARD_ANNUAL"
  region            = "us-central1"
  public_ip_enabled = false
  private_ip_enabled = true # Private connectivity but no consumer_network
  project           = var.project
  # Missing consumer_network field
  
  # Required fields for Looker Core
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}