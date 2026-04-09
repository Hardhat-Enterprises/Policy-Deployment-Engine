resource "google_looker_instance" "c1" {
  name = "c1"
  project           = var.project
  public_ip_enabled = false
  private_ip_enabled = true
  psc_enabled       = true
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}





