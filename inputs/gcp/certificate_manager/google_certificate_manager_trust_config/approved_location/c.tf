resource "google_certificate_manager_trust_config" "c" {
  name     = "c"
  project  = "sit764-policy-project"
  location = "australia-southeast1"

  labels = {
    environment = "prod"
  }
}