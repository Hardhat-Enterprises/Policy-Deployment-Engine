resource "google_integrations_auth_config" "compliant_example_1" {
  display_name = "compliant_example_1"
  location     = "us-central1"
  project      = "your-gcp-project-id"
  visibility   = "PRIVATE"   # Least exposure - compliant
}
