resource "google_app_engine_application" "non_compliant_example_1" {
  project = "gcp-test-project"
  location_id   = "us-central"
  database_type = "CLOUD_DATASTORE_COMPATIBILITY"
}
