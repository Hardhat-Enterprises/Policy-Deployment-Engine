resource "google_looker_instance" "nc" {
  name = "nc1"
  project = var.project
  # consumer_network intentionally omitted to trigger failure
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}






