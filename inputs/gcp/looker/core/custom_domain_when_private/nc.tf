resource "google_looker_instance" "bad" {
  name              = "bad"
  project           = var.project
  public_ip_enabled = false
  # custom_domain block intentionally omitted to trigger failure
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

