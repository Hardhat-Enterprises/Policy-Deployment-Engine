resource "google_app_engine_application" "c" {
  project     = "gcp-project-12345"
  location_id = "australia-southeast1"

  feature_settings {
    split_health_checks = true
  }
}