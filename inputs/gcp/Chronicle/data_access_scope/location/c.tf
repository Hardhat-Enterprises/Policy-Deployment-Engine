resource "google_chronicle_data_access_scope" "compliant_scope_location" {
  project              = "fake-test-project"
  location             = "australia-southeast1"  # Valid location
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "compliant location-c"
  description          = "Compliant data access scope with valid location"
  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
