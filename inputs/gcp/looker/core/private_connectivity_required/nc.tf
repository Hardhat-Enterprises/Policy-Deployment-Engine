resource "google_looker_instance" "nc" {
  name = "nc1"
  project           = var.project
  public_ip_enabled = true
  # private_ip_enabled = false (default/omitted)
  # psc_enabled       = false (default/omitted)
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}







