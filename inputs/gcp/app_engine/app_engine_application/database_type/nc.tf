resource "google_app_engine_application" "nc" {
  project       = "gcp-test-project"
  location_id   = "us-central"
  database_type = "CLOUD_DATASTORE_COMPATIBILITY"
}