resource "google_looker_instance" "nc" {
  name = "nc1"
  project          = var.project
  platform_edition = "LOOKER_CORE_TRIAL"  # Trial edition to trigger failure
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}







