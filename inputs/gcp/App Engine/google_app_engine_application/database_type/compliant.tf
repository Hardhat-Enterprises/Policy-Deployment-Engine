resource "google_app_engine_application" "compliant_example_1" {
  project = "gcp-test-project"
  location_id   = "us-central"
  database_type = "CLOUD_FIRESTORE"
}
