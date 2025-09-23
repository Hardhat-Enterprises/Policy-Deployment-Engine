resource "google_looker_instance" "nc" {
  name = "nc1"
  project = var.project
  oauth_config {
    client_id     = ""  # Empty client_id to trigger failure
    client_secret = "test-client-secret"
  }
}







