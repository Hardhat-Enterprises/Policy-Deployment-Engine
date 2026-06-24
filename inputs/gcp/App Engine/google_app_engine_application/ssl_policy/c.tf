resource "google_app_engine_application" "c" {
  project     = "gcp-project-12345"
  location_id = "us-central"

  ssl_policy = "DEFAULT"
}