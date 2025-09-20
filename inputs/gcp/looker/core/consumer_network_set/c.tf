resource "google_looker_instance" "ok" {
  name             = "ok"
  project          = var.project
  consumer_network = "projects/test-project-123/global/networks/test-vpc"
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}