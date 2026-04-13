resource "google_app_engine_application" "nc" {
  project        = "gcp-project-12345"
  location_id    = "australia-southeast1"
  serving_status = "USER_DISABLED"
}