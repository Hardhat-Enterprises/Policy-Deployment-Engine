resource "google_looker_instance" "c" {
  name = "c"
  project = var.project
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

