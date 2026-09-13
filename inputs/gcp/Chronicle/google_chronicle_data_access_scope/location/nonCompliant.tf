resource "google_chronicle_data_access_scope" "non_compliant_example_1" {
  project              = "fake-test-project"
  location             = "South-Africa" # Invalid location
  instance             = "00000000-0000-0000-0000-000000000000"
  data_access_scope_id = "non_compliant_example_1"
  description          = "Compliant data access scope with valid location"

  allowed_data_access_labels {
    log_type = "GCP_CLOUDAUDIT"
  }
}
