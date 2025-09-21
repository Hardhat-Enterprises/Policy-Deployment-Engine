resource "google_looker_instance" "c" {
  name = "c1"
  project            = var.project
  psc_enabled        = true
  public_ip_enabled  = false
  private_ip_enabled = false
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}





