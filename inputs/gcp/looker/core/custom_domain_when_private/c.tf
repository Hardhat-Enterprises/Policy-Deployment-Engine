resource "google_looker_instance" "c" {
  name = "c1"
  project           = var.project
  public_ip_enabled = false
  custom_domain {
    domain = "looker.example.com"
  }
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}






