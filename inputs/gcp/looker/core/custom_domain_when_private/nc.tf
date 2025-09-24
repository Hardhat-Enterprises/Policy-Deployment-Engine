resource "google_looker_instance" "nc" {
  name = "nc1"
  project           = var.project
  public_ip_enabled = false
  # custom_domain block intentionally omitted to trigger failure
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}







