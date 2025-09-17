resource "google_looker_instance" "bad" {
  name               = "bad"
  project            = var.project
  psc_enabled        = true
  public_ip_enabled  = true      # â† triggers Situation A
  private_ip_enabled = false
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

