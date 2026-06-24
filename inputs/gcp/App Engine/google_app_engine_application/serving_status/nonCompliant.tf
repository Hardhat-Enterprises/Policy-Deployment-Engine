resource "google_app_engine_application" "non_compliant_example_1" {
  project        = "gcp-project-12345"
  location_id    = "australia-southeast1"
  serving_status = "USER_DISABLED"
}
