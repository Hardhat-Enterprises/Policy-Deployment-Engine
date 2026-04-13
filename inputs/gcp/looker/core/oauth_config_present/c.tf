resource "google_looker_instance" "c1" {
  name    = "c1"
  project = var.project
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}





