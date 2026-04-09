resource "google_app_engine_application" "c" {
  project        = "gcp-project-12345"
  location_id    = "australia-southeast1"
  serving_status = "SERVING"
}