resource "google_certificate_manager_trust_config" "nc" {
  name     = "nc"
  project  = "sit764-policy-project"
  location = "us-central1"

  labels = {
    environment = "prod"
  }
}