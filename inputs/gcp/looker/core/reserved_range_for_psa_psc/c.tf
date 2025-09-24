resource "google_looker_instance" "c" {
  name = "c1"
  project        = var.project
  reserved_range = "projects/test-project-123/global/addresses/test-reserved-range"
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}





