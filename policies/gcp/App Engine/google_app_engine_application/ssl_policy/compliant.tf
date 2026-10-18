resource "google_app_engine_application" "compliant_example_1" {
  project     = "gcp-project-12345"
  location_id = "us-central"

  ssl_policy = "DEFAULT"
}
