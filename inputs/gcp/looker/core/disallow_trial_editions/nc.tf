resource "google_looker_instance" "bad" {
  name             = "bad"
  project          = var.project
  platform_edition = "LOOKER_CORE_TRIAL"  # Trial edition to trigger failure
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}

