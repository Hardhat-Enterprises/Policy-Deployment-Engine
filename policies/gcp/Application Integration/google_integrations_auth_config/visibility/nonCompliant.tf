resource "google_integrations_auth_config" "non_compliant_example_1" {
  display_name = "non_compliant_example_1"
  location     = "us-central1"
  project      = "your-gcp-project-id"
  visibility   = "CLIENT_VISIBLE"
}

# Non-compliant: visibility NOT SET (null)
resource "google_integrations_auth_config" "non_compliant_example_2" {
  display_name = "non_compliant_example_2"
  location     = "us-central1"
  project      = "your-gcp-project-id"
  # visibility attribute intentionally omitted
}
