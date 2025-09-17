resource "google_looker_instance" "ok" {
  name    = "ok"
  project = var.project
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}
