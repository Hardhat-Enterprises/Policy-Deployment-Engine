resource "google_certificate_manager_trust_config" "non_compliant_example_1" {
  name     = "non_compliant_example_1"
  project  = "sit764-policy-project"
  location = "us-central1"

  labels = {
    environment = "prod"
  }
}
