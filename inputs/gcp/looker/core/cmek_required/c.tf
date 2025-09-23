resource "google_looker_instance" "c" {
  name = "c1"
  project = var.project
  encryption_config {
    kms_key_name = "projects/test-project-123/locations/us-central1/keyRings/test-keyring/cryptoKeys/test-key"
  }
  oauth_config {
    client_id     = "test-client-id"
    client_secret = "test-client-secret"
  }
}





