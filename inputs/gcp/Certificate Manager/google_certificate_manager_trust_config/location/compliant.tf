resource "google_certificate_manager_trust_config" "compliant_example_1" {
  name     = "compliant_example_1"
  project  = "sit764-policy-project"
  location = "australia-southeast1"

  labels = {
    environment = "prod"
  }
}
