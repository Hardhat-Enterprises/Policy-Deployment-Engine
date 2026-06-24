resource "google_app_engine_application" "c" {
  project = "gcp-test-project"
  location_id   = "us-central"
  database_type = "CLOUD_FIRESTORE"
}