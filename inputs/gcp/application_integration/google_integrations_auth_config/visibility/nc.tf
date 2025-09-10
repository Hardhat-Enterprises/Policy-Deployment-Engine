resource "google_integrations_auth_config" "nc_client_visibility" {
  display_name = "nc1"
  location     = "us-central1"
  project      = "your-gcp-project-id"
  visibility   = "CLIENT_VISIBLE"
}

# Non-compliant: visibility NOT SET (null)
resource "google_integrations_auth_config" "nc_null_visibility" {
  display_name = "nc2"
  location     = "us-central1"
  project      = "your-gcp-project-id"
  # visibility attribute intentionally omitted
}
