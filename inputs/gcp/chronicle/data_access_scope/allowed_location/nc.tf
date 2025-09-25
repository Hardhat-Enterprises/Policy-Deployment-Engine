resource "google_chronicle_data_access_scope" "nc" {
  project              = "fake-test-project"
  location             = "South-Africa"  # Invalid location
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "nc"
  description          = "Non-compliant data access scope with invalid location"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
