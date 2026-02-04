resource "google_app_engine_application" "nc" {
  project     = "gcp-project-12345"
  location_id = "us-central"

  ssl_policy = "SSL_POLICY_UNSPECIFIED"
}